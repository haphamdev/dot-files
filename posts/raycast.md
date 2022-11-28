# How I boost my productivity with [Raycast](https://www.raycast.com/)
Disclaimer: Not only for a software developer 😎

MacOS gives us Spotlight, a powerful tool to quickly open applications and switch from one app to another.
No longer moving the mouse pointer to choose the app we need...

It's awesome 🎉. But not enough 😢. We want more things like that.
Because typing the shortcut keys in keyboard is absolutely faster than moving around the screen with mouse or trackpad,
**not only for opening applications on your computer.**

We have to jump to different Zoom calls every working day, we frequently open some directories storing all things we need for work or entertainment, 
we visit a website tens of times everyday, our web browser keeps opening a huge bunch of tabs because we want to quickly view it when we need, **why not make shortcut for it?**

Let's check out [Raycast](https://www.raycast.com/) (it's free) and I promise you'll never think again.

## Goodbye, Spotlight!
If you usually hover your mouse pointer over the long list of application icons pinned on the Dock just to open an application,
you no longer need it. Just hit `Cmd+space` and type some letters before hitting `Return` key to open or jump to your application.

Wait, is it Spotlight I'm talking about?
Uhmm, perhaps yes, but no.
You can do the same thing with Spotlight, or [Alfred](https://www.alfredapp.com/) (an even better tool 👍), but still no, I'm talking about Raycast 💯.
Just download and install Raycast, and try it. Believe me, it'll work.

### But Spotlight keeps showing up when hitting Cmd+Space 🤷‍♂️
No worry, you can get rid of it in 1 minute.

First, open Raycast (I truly believe you can open an app on MacOS 👊), you will see Raycast icon in the Menu bar on the right top area of your screen. Keep it there, we'll use it later.

Open `System preferences > Keyboard` (you can do that in Spotlight by `Cmd+Space` and type `keyboard`),
select `Shorcuts` tab on the top of the pop up, then select `Spotlight` on the left menu. 
Finally, uncheck the option `Show Spotlight search` on the right pane. That's it.

Now, `Cmd+Space` will not bring Spotlight up anymore. Instead, we need it to bring Raycast up.

Now you can click on the Raycast icon on the menu bar and open `Preferences`.

<img width="307" alt="image" src="https://user-images.githubusercontent.com/6322508/204126055-d4efd4ad-ff6e-451c-9d6d-6dd1848bf608.png">

In Raycast Preferences window, we can configure a shortcut key for Raycast by clicking on `Raycast Hotkey`, 
and type the hotkey that we like, of course, it will be `Cmd+Space`.

<img width="1004" alt="image" src="https://user-images.githubusercontent.com/6322508/204126064-2e2069d1-4233-44e4-a54f-542ee911c435.png">

Now you can open Raycast with `Cmd+Space`. So you can uncheck `Show Raycast on menu bar` to remove the Raycast icon on you menu bar, save some space for other stuffs.

## OK, what makes Raycast better than Spotlight then?
What makes Raycast so powerful is the huge list of extensions that can satisfy all needs from the users.
To see all extension, just open Raycast with `Cmd+Space` then type `Extensions` and hit `Return`.
Now you can see the Raycast Extension preferences which contains all extensions installed in your Raycast.
If the extension you want to use does not show here, it means you have not installed it yet.
You can install by clicking on the + button on the top right corner and choose `Install From Store`

<img width="1010" alt="image" src="https://user-images.githubusercontent.com/6322508/204164057-967dcb9f-9f4e-4b6c-afe8-0189382620e1.png">

Are you ready to explore the power of Raycast? Go!!!

## Quickly open websites or files
### Let's open our website in a blink of an eye
For instance, if you need to visit your JIRA board or roadmap every now and then, you can create a shortcut for it.

To create a quicklink, let's open Raycast (again, `Cmd+Space`), type `extensions` (or just `ext` would be enough, Raycast is so smart)
and hit `return` to open Raycast Extensions preferences.

Scroll down to see the `Quicklinks` configuration. You can add or edit your quicklinks there.

You can also set alias for each quicklink if you like so that you can quickly open it with the alias instead of typing the quicklink name.
For example, to create a quicklink for searching video on YouTube:
- Quicklink name: Search on YouTube
- Link: `https://www.youtube.com/results?search_query={query}`
- Open with: Safari (or your default web browser)
- Alias: `yt`

<img width="509" alt="image" src="https://user-images.githubusercontent.com/6322508/204128131-9e7b0e48-a4d9-452f-b15a-f6d26ed16c52.png">

Now you can type `yt<space>beautiful piano` to search for `beautiful piano` on YouTube.
As you can see, `{query}` in the quicklink will be replaced by the keywords you typed after `<space>`.
This approach can be applied for many website with search features, e.g. Google, YouTube, JIRA,  etc.
You can test it by searching for something in your web browser and look at the URL of that search result.

You can create quicklink to do many things: open frequently used websites, Google search, search for JIRA ticket or Confluence page,
search files/directories on your Google drive, etc. 💯

### Opening frequently used files/directories

With quicklinks, you can also quickly open your files with the same way as for your websites.

Just replace the `link` with the full path to your file/directory and choose the application to open that file via `Open with` option.

For example, the below quicklink helps me quickly open Downloads directory when typing `dwn` in Raycast
- Quicklink name: Open Downloads
- Link: `~/Downloads`
- Open with: Finder
- Alias: `dwn`

<img width="1005" alt="image" src="https://user-images.githubusercontent.com/6322508/204164640-dcf5f0b6-e5b5-4c6d-bc3e-127395ab1d39.png">


## Pasting items from clipboard history
Every computer user needs clipboard to copy or move something to somewhere. But the clipboard only stores the last thing that we copy. That's paintful. 😭

Raycast can help you to manage hundreds of items in clipboard and you can quickly search for it before pasting.
For example, I am sure that I copied the text `Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua` yesterday,
now you want to paste it to your Google slide. I can simply press `Cmd+Shift+V` then type `lorem` and hit `Return` to paste it.

To enable clipboard manager in your Raycast, make sure **Clipboard History** extension is installed via Raycast store.
Don't forget to set the hotkey for your Clipboard History extension to quickly access it, `Cmd+Shift+V` would be a nice choice.

## Quickly search for emoji, like this 😉
If you are a fan of emoji 👍, you will like the `Search Emoji` extension.

## Quickily search for earch gif
`Search for GIFs` would be a nice extension to search for the funny animated images.
This extension helps you quickly copy the URL of the funny gifs and then paste it to your chat.

## Moving and resizing windows is now so simple
If you usually place your application windows side by side 
or split your screen into multiple smaller areas where you can view multiple applications, Raycast would be a big help for you.

<img width="1511" alt="image" src="https://user-images.githubusercontent.com/6322508/204283648-6107336d-119b-4a77-a33d-d6a19eebcaf1.png">

`Window Management` extension supports a lot of nice features: moving window to next display, 
resizing your window (right half, left half, bottom half, up-right quarter, maximizing, etc.).
With some hotkeys configured, now you can move your windows around the screen like magic.

## Jumping to your online meeting within 1 second
This is one of the most interesting feature that Raycast can bring to me.
With **Calendar** extension, you can quickly view your schedules in your calendar.

<img width="753" alt="image" src="https://user-images.githubusercontent.com/6322508/204285002-d67cd849-b716-4990-99d3-afa752096dc8.png">

Especially, if your schedule contains Zoom or Google Meet link, 5 minutes before and after the meeting starts,
just open Raycast and you can see the meeting will show up right away on top, just hit enter to join the call.

# Enjoy it!
So far, I have shown you a bunch of features that Raycast can boost your productivity. 
I enjoyed it a lot, hopefully it can do the same for your life.

There are still more extensions in the store for us to discover: searching web browser bookmarks, calculator, translation, etc.
If you find out any other nice extension, please share it with me.

Have a nice day!

