# Subtilest - The Subtitles Finder

## Problem : How many times do you download a movie/episode and you don't have the subtitles ?

We love subtitles. As a non-native english speaker, I learned a lot of words watching movies with subtitles and yet they are so hard to find. 

I build this tool so that I can watch movies with my girlfriend that doesn't understand english (pun intended). Kidding, I don't have one.

So, how would it work ?

## Design choices

The first decision that needs to be made is the format of the application. Will it be dock-based or will it stay in the status-bar ? These decisions will hugely impact UX.

Here is how I imagine the experience :

User Experience guidelines are hard to set because of the sandboxing rules imposed by Apple. 

Drag and Dropping is the easiest way to get it to launch with the right permissions on the movie file. 

Hence I think a dock icon as dropping target totally makes sense.

When it comes to the NSWindow itself, it just needs an activity indicator while fetching the subtitles.

Easy to use and pretty straightforward.

The question I ask myself now is what's the best way of loading the subtitles then ? Where do we save them due to sandboxing ? 

I wish I could load VLC with the subtitles in a URL scheme but couldn't find any way to do that on the Mac.

## Development

Install the dependencies with CocoaPods

    $ pod install

Then patch XMLRPCConnection.m

    $ cd Pods/xmlrpc; patch -p1 < ../../Patches/xmlrpc-fix-threading-issue.patch

Make sure to always open the Xcode workspace instead of the project file when building the project

    $ open Subtilest.xcworkspace

Or just run

  $ make