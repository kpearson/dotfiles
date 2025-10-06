# Logitech Mouse Configuration

## Notification Center Button Mapping

Configure a Logitech mouse button to toggle macOS Notification Center.

### Prerequisites
- Logitech Options+ app installed
- Logitech mouse with programmable buttons

### Steps

#### 1. Verify macOS Keyboard Shortcut

Open **System Settings** → **Keyboard** → **Keyboard Shortcuts** → **Mission Control**

Find **"Show Notification Center"** and verify the shortcut is set to:
- Default: `Option + s` (⌥ + s)

If you want to use a different shortcut, configure it here first, then use that in step 2.

#### 2. Configure Mouse Button in Logi Options+

1. Open **Logi Options+** app
2. Select your Logitech mouse
3. Click on the button you want to configure
4. Choose **"Smart Actions"** from the action menu
5. Create a new Smart Action:
   - Type: Keyboard shortcut
   - Keys: `Option + s` (or your custom shortcut from step 1)
6. Save the Smart Action
7. Apply the Smart Action to your mouse button

### Notes

- **Logi Options+ vs Legacy Logitech Options**: The newer Logi Options+ app uses "Smart Actions" to map keyboard shortcuts to buttons, replacing the direct keyboard shortcut mapping from the legacy app.
- The default macOS shortcut for Notification Center is `Option + s` (⌥ + s)
- You can use any available mouse button (side buttons, thumb buttons, etc.)
- The Notification Center gesture is a two-finger swipe from the right edge of the trackpad

### Troubleshooting

If the button doesn't work:
1. Verify the keyboard shortcut in System Settings matches exactly what you configured in Logi Options+
2. Restart Logi Options+ app
3. Test the keyboard shortcut directly (⌥ + s) to ensure macOS responds
4. Check that the Smart Action is properly assigned to the button
