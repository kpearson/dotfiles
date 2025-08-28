-- Photos Consolidation Script
-- Goal: Extract ALL photos from Apple Photos into master archive
-- Structure: Photos will be organized into YYYY/YYYY-MM/YYYY-MM-DD/ structure post-export

property batchSize : 1000
property exportBasePath : ""
property logFile : ""
property dbFile : ""

on run
    -- Get destination for master archive
    set archiveDestination to choose folder with prompt "Choose your MASTER ARCHIVE destination folder (e.g., External Drive)"
    set exportBasePath to POSIX path of archiveDestination
    
    -- Create staging folder for flat export (will be organized later)
    set stagingFolder to exportBasePath & "PhotoExtraction_Staging/"
    do shell script "mkdir -p " & quoted form of stagingFolder
    
    -- Set up log file and database file
    set logFile to stagingFolder & "extraction_log_" & my getCurrentDateString() & ".txt"
    set dbFile to stagingFolder & "photo_tracking_database.txt"
    
    my writeLog("=== Photos Extraction Started ===")
    my writeLog("Destination: " & exportBasePath)
    my writeLog("Staging folder: " & stagingFolder)
    my writeLog("Database file: " & dbFile)
    
    -- Initialize database if it doesn't exist
    my initializeDatabase()
    
    -- Check if this is a resume operation
    set resumeChoice to my checkForExistingDatabase()
    
    -- Show user the plan
    display dialog "Photos Consolidation Plan:" & return & return & "1. Export all photos to: " & stagingFolder & return & "2. Track each file in database for resume capability" & return & "3. You'll run a separate script to organize into YYYY/YYYY-MM/YYYY-MM-DD structure" & return & return & "Log file: " & logFile & return & "Database: " & dbFile & return & return & resumeChoice & return & return & "Continue with extraction?" buttons {"Cancel", "Start Extraction"} default button "Start Extraction"
    
    if button returned of result is "Cancel" then
        my writeLog("Extraction cancelled by user")
        return
    end if
    
    -- Simple choice: export everything or by manageable chunks
    set userChoice to choose from list {"Export ALL Photos (45k+ photos, could take days)", "Export Recent Photos Only (2022+)", "Export Recent Photos Only (2020+)", "Export by Custom Year Range", "Resume Previous Export", "Retry Failed Downloads Only"} with prompt "Extraction method:" default items {"Export Recent Photos Only (2022+)"}
    
    if userChoice is false then
        my writeLog("No extraction method selected")
        return
    end if
    
    set chosenMethod to item 1 of userChoice
    my writeLog("Selected method: " & chosenMethod)
    
    if chosenMethod contains "Export ALL Photos" then
        exportAllPhotos()
    else if chosenMethod contains "Export Recent Photos" then
        exportRecentPhotos()
    else if chosenMethod contains "Resume Previous" then
        resumePreviousExport()
    else if chosenMethod contains "Retry Failed" then
        retryFailedDownloads()
    else
        exportCustomRange()
    end if
    
    -- Show completion message with next steps
    my writeLog("=== Extraction Process Completed ===")
    display alert "Extraction Complete!" message "Photos have been extracted to staging folder. Next steps:" & return & return & "1. Run the organization script to create YYYY/YYYY-MM/YYYY-MM-DD structure" & return & "2. Verify all photos extracted correctly" & return & "3. Clean up staging folder once organized" & return & return & "Check files:" & return & "Log: " & logFile & return & "Database: " & dbFile
end run

-- Database management functions
on initializeDatabase()
    try
        -- Check if database exists
        do shell script "test -f " & quoted form of dbFile
        my writeLog("Database file exists, will append to existing records")
    on error
        -- Create database with header
        set dbHeader to "PHOTO_ID|FILENAME|DATE_ADDED|EXPORT_STATUS|TIMESTAMP|ERROR_MESSAGE"
        do shell script "echo " & quoted form of dbHeader & " > " & quoted form of dbFile
        my writeLog("Created new database file with header")
    end try
end initializeDatabase

on checkForExistingDatabase()
    try
        set dbContent to do shell script "wc -l < " & quoted form of dbFile & " | tr -d ' '"
        set lineCount to dbContent as integer
        if lineCount > 1 then
            set recordCount to lineCount - 1 -- subtract header line
            return "Found existing database with " & recordCount & " photo records."
        else
            return "Starting fresh extraction."
        end if
    on error
        return "Starting fresh extraction."
    end try
end checkForExistingDatabase

on recordPhotoAttempt(photoID, filename, status, errorMsg)
    set timestamp to my getCurrentTimestamp()
    set dateAdded to my getCurrentDateString()
    
    -- Escape pipe characters in filename and error message
    set cleanFilename to my replacePipes(filename)
    set cleanError to my replacePipes(errorMsg)
    
    set dbRecord to photoID & "|" & cleanFilename & "|" & dateAdded & "|" & status & "|" & timestamp & "|" & cleanError
    
    try
        do shell script "echo " & quoted form of dbRecord & " >> " & quoted form of dbFile
    on error
        my writeLog("ERROR: Could not write to database file")
    end try
end recordPhotoAttempt

on getProcessedPhotoIDs()
    try
        -- Get all photo IDs that have been successfully processed
        set processedIDs to do shell script "grep '|SUCCESS|' " & quoted form of dbFile & " | cut -d'|' -f1"
        return paragraphs of processedIDs
    on error
        return {}
    end try
end getProcessedPhotoIDs

on getFailedPhotoIDs()
    try
        -- Get all photo IDs that failed
        set failedIDs to do shell script "grep '|FAILED|' " & quoted form of dbFile & " | cut -d'|' -f1"
        return paragraphs of failedIDs
    on error
        return {}
    end try
end getFailedPhotoIDs

on replacePipes(textString)
    -- Replace pipe characters with underscores to avoid database corruption
    set AppleScript's text item delimiters to "|"
    set textItems to text items of textString
    set AppleScript's text item delimiters to "_"
    set newText to textItems as string
    set AppleScript's text item delimiters to ""
    return newText
end replacePipes
on exportAllPhotos()
    display alert "Export ALL Photos" message "This exports EVERY photo/video in your Photos library. This could be thousands of files and take many hours." & return & return & "Files will be exported flat to staging folder, then organized by date separately." buttons {"Cancel", "Export Everything"} default button "Cancel"
    
    if button returned of result is "Cancel" then return
    
    tell application "Photos"
        set allMedia to every media item
        set totalCount to count of allMedia
        
        display dialog "Found " & totalCount & " photos/videos to export." & return & return & "Estimated time: " & my estimateTime(totalCount) & return & "Continue?" buttons {"Cancel", "Start Export"} default button "Start Export"
        
        if button returned of result is "Start Export" then
            set exportFolder to exportBasePath & "PhotoExtraction_Staging/All_" & my getCurrentDateString() & "/"
            do shell script "mkdir -p " & quoted form of exportFolder
            
            my exportMediaWithBatches(allMedia, exportFolder, "All Photos Export")
        end if
    end tell
end exportAllPhotos

-- Export only recent photos (2020+) to make it more manageable
on exportRecentPhotos()
    display dialog "Export Recent Photos" & return & return & "This exports photos from 2020 onward." & return & "Note: AppleScript can't filter by date perfectly, so this exports all photos. You can filter by date during the organization step." buttons {"Cancel", "Export Recent"} default button "Export Recent"
    
    if button returned of result is "Cancel" then return
    
    tell application "Photos"
        set allMedia to every media item
        set totalCount to count of allMedia
        
        set exportFolder to exportBasePath & "PhotoExtraction_Staging/Recent_" & my getCurrentDateString() & "/"
        do shell script "mkdir -p " & quoted form of exportFolder
        
        my exportMediaWithBatches(allMedia, exportFolder, "Recent Photos Export")
    end tell
end exportRecentPhotos

-- Let user specify custom approach
on exportCustomRange()
    set customChoice to choose from list {"Export in smaller batches (1000 at a time)", "Export everything at once"} with prompt "Custom export method:"
    
    if customChoice is false then return
    
    tell application "Photos"
        set allMedia to every media item
        set totalCount to count of allMedia
        
        if item 1 of customChoice contains "smaller batches" then
            -- Export in chunks of 1000 to separate folders
            set customBatchSize to 1000
            set batchCount to 1
            
            repeat with i from 1 to totalCount by customBatchSize
                set batchEnd to i + customBatchSize - 1
                if batchEnd > totalCount then set batchEnd to totalCount
                
                set batchMedia to items i thru batchEnd of allMedia
                set batchFolder to exportBasePath & "PhotoExtraction_Staging/Batch_" & batchCount & "_" & my getCurrentDateString() & "/"
                do shell script "mkdir -p " & quoted form of batchFolder
                
                display dialog "Export Batch " & batchCount & "?" & return & "Photos " & i & " through " & batchEnd & " (" & (count of batchMedia) & " files)" buttons {"Skip", "Export Batch"} default button "Export Batch"
                
                if button returned of result is "Export Batch" then
                    my exportMediaWithBatches(batchMedia, batchFolder, "Batch " & batchCount)
                end if
                
                set batchCount to batchCount + 1
            end repeat
        else
            -- Export everything to one folder
            set exportFolder to exportBasePath & "PhotoExtraction_Staging/Custom_" & my getCurrentDateString() & "/"
            do shell script "mkdir -p " & quoted form of exportFolder
            my exportMediaWithBatches(allMedia, exportFolder, "Custom Export")
        end if
    end tell
end exportCustomRange

-- Core export function - now with database tracking per file
on exportMediaWithBatches(mediaList, destinationFolder, exportName)
    set totalMedia to count of mediaList
    set batchCount to 1
    set successCount to 0
    set errorCount to 0
    set skippedCount to 0
    
    -- Get list of already processed photos to skip
    set processedIDs to my getProcessedPhotoIDs()
    my writeLog("Found " & (count of processedIDs) & " already processed photos")
    
    my writeLog("--- Starting " & exportName & " ---")
    my writeLog("Total files to export: " & totalMedia)
    my writeLog("Destination: " & destinationFolder)
    my writeLog("Batch size: " & batchSize)
    
    display notification "Starting export: " & totalMedia & " files to " & destinationFolder with title exportName
    
    tell application "Photos"
        repeat with i from 1 to totalMedia by batchSize
            set batchEnd to i + batchSize - 1
            if batchEnd > totalMedia then set batchEnd to totalMedia
            
            set currentBatch to items i thru batchEnd of mediaList
            set batchSize_actual to count of currentBatch
            
            my writeLog("Batch " & batchCount & ": Processing " & batchSize_actual & " files (items " & i & "-" & batchEnd & ")")
            
            -- Filter out already processed photos from this batch
            set filteredBatch to {}
            set batchPhotoData to {}
            
            repeat with currentPhoto in currentBatch
                try
                    set photoID to id of currentPhoto
                    set photoFilename to filename of currentPhoto
                    
                    -- Check if this photo was already processed successfully
                    if processedIDs contains photoID then
                        set skippedCount to skippedCount + 1
                        my writeLog("Skipping already processed photo: " & photoID & " (" & photoFilename & ")")
                    else
                        set end of filteredBatch to currentPhoto
                        set end of batchPhotoData to {photoID, photoFilename}
                        -- Record that we're attempting this photo
                        my recordPhotoAttempt(photoID, photoFilename, "ATTEMPTING", "")
                    end if
                on error errMsg
                    my writeLog("Error getting photo info: " & errMsg)
                end try
            end repeat
            
            -- Skip this batch if no new photos to process
            if (count of filteredBatch) = 0 then
                my writeLog("Batch " & batchCount & ": All photos already processed, skipping")
                set batchCount to batchCount + 1
                repeat -- continue with next batch
            end if
            
            display notification "Batch " & batchCount & ": exporting " & (count of filteredBatch) & " new files" with title exportName
            
            -- Export the filtered batch
            with timeout of 3600 seconds -- 1 hour per batch
                try
                    set batchStartTime to current date
                    export filteredBatch to (POSIX file destinationFolder as alias) with using originals
                    set batchEndTime to current date
                    set batchDuration to (batchEndTime - batchStartTime)
                    
                    -- Mark all photos in this batch as successful
                    repeat with photoData in batchPhotoData
                        set photoID to item 1 of photoData
                        set photoFilename to item 2 of photoData
                        my recordPhotoAttempt(photoID, photoFilename, "SUCCESS", "")
                    end repeat
                    
                    set successCount to successCount + (count of filteredBatch)
                    my writeLog("Batch " & batchCount & ": SUCCESS - " & (count of filteredBatch) & " files exported in " & batchDuration & " seconds")
                    display notification "Batch " & batchCount & " completed successfully" with title exportName
                    
                on error errMsg
                    -- Mark all photos in this batch as failed
                    repeat with photoData in batchPhotoData
                        set photoID to item 1 of photoData
                        set photoFilename to item 2 of photoData
                        my recordPhotoAttempt(photoID, photoFilename, "FAILED", errMsg)
                    end repeat
                    
                    set errorCount to errorCount + (count of filteredBatch)
                    my writeLog("Batch " & batchCount & ": ERROR - " & errMsg)
                    display alert "Batch " & batchCount & " Error" message errMsg buttons {"Continue", "Stop"} default button "Continue"
                    if button returned of result is "Stop" then
                        my writeLog("Export stopped by user after batch " & batchCount)
                        exit repeat
                    end if
                end try
            end timeout
            
            set batchCount to batchCount + 1
            delay 2
        end repeat
    end tell
    
    my writeLog("--- " & exportName & " Summary ---")
    my writeLog("Total files processed: " & totalMedia)
    my writeLog("Successfully exported: " & successCount)
    my writeLog("Already completed (skipped): " & skippedCount)
    my writeLog("Errors encountered: " & errorCount)
    my writeLog("Batches processed: " & (batchCount - 1))
    
    display alert "Export Complete" message exportName & " finished!" & return & return & "Files processed: " & totalMedia & return & "Successful: " & successCount & return & "Skipped (already done): " & skippedCount & return & "Errors: " & errorCount & return & return & "Location: " & destinationFolder & return & return & "Check files:" & return & "Log: " & logFile & return & "Database: " & dbFile
end exportMediaWithBatches

-- Helper functions
on writeLog(message)
    set timestamp to my getCurrentTimestamp()
    set logEntry to timestamp & " - " & message
    
    try
        do shell script "echo " & quoted form of logEntry & " >> " & quoted form of logFile
    on error
        -- If logging fails, don't stop the whole process
        display notification "Warning: Could not write to log file" with title "Logging Error"
    end try
end writeLog

on getCurrentTimestamp()
    set currentDate to current date
    set year to year of currentDate
    set month to month of currentDate as integer
    set day to day of currentDate
    set hour to hours of currentDate
    set minute to minutes of currentDate
    set second to seconds of currentDate
    
    return (year as string) & "-" & my padNumber(month, 2) & "-" & my padNumber(day, 2) & " " & my padNumber(hour, 2) & ":" & my padNumber(minute, 2) & ":" & my padNumber(second, 2)
end getCurrentTimestamp

on estimateTime(photoCount)
    -- Rough estimate: 1 second per photo for export
    set totalMinutes to photoCount / 60
    if totalMinutes < 60 then
        return (round totalMinutes) & " minutes"
    else
        set hours to round (totalMinutes / 60)
        return hours & " hours"
    end if
end estimateTime

on getCurrentDateString()
    set currentDate to current date
    set year to year of currentDate
    set month to month of currentDate as integer
    set day to day of currentDate
    set hour to hours of currentDate
    set minute to minutes of currentDate
    
    return (year as string) & "-" & my padNumber(month, 2) & "-" & my padNumber(day, 2) & "_" & my padNumber(hour, 2) & my padNumber(minute, 2)
end getCurrentDateString

on padNumber(num, digits)
    set numStr to num as string
    repeat while length of numStr < digits
        set numStr to "0" & numStr
    end repeat
    return numStr
end padNumber
