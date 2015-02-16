# Navigating
    visit('/projects')
    visit(post_comments_path(post))
 
# Clicking_links_and_buttons
    click_link('id-of-link')
    click_link('Link Text')
    click_button('Save')
    click('Link Text') # Click either a link or a button
    click('Button Value')
 
# Interacting_with_forms
    fill_in('First Name', :with => 'John')
    fill_in('Password', :with => 'Seekrit')
    fill_in('Description', :with => 'Really Long Text…')
    choose('A Radio Button')
    check('A Checkbox')
    uncheck('A Checkbox')
    attach_file('Image', '/path/to/image.jpg')
    select('Option', :from => 'Select Box')
 
# Scoping
    within("//li[@id='employee']") do
      fill_in 'Name', :with => 'Jimmy'
    end
    within(:css, "li#employee") do
      fill_in 'Name', :with => 'Jimmy'
    end
    within_fieldset('Employee') do
      fill_in 'Name', :with => 'Jimmy'
    end
    within_table('Employee') do
      fill_in 'Name', :with => 'Jimmy'
    end
 
# Querying
    page.has_xpath?('//table/tr')
    page.has_css?('table tr.foo')
    page.has_content?('foo')
    page.should have_xpath('//table/tr')
    page.should have_css('table tr.foo')
    page.should have_content('foo')
    page.should have_no_content('foo')
    find_field('First Name').value
    find_link('Hello').visible?
    find_button('Send').click
    find('//table/tr').click
    locate("//*[@id='overlay'").find("//h1").click
    all('a').each { |a| a[:href] }
 
# Scripting
    result = page.evaluate_script('4 + 4');
 
# Debugging
    save_and_open_page
 
# Asynchronous JavaScript
    click_link('foo')
    click_link('bar')
    page.should have_content('baz')
    page.should_not have_xpath('//a')
    page.should have_no_xpath('//a')
 
# XPath_and_CSS
    within(:css, 'ul li') { some_stuff }
    find(:css, 'ul li').text
    locate(:css, 'input#name').value
    Capybara.default_selector = :css
    within('ul li') { some_stuff }
    find('ul li').text
    locate('input#name').value

# 1-st author of this gist: Zheng Jia, github.com/zhengjia
# Maintainer: Orlov Oleg, github.com/OrelSokolov
# Feel free to edit, nobody can stop you :)
