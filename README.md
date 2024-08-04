# Tclcam

Goal:

I’m trying to, via a C library imported into my Tcl script on MacOS, make a script that:

- [ ] 1. Reads what web cams (including the built in one) are available
- [ ] 2. Offers those as a list on the CLI
- [ ] 3. Allows you to move arrow keys up/down & press enter to select a camera
- [ ] 4. Takes a photo from the camera (I assume I have to write an Objective-C or Swift adapter program on the side that takes the camera input and send it to the C or Tcl subprocess to save it to memory, right?)
- [ ] 5. Saves it to ~/Downloads AND displays it to the GUI using a tiny Tk script.

This repo currently does only 1. and 2.