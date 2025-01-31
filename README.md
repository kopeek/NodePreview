# NodePreview
 A plugin for Godot 4.2+ to help you make "screenshots" or "image" of any sprite in 2D world
(Probably also in 3D in the future)

## Docs
- Settings
    - [Capture section](#Capture)
        - [Capture types](#Capture-types)
            - Capture Sprite
            - Capture Box
            - Custom Capture Box
            - Capture Rect
        - [Offset settings](#offset-settings)
            - Try to center
            - Use node pivot offset
        - [How to get image](#how-to-get-image)
    - [SubViewport](#custom-camera2d-and-subviewport)
    - [Camera](#custom-camera2d-and-subviewport)

    - [Contact and collaboration](#contact-and-collaboration)
    - [Future update](#)


# Capture
![NodePreview settings](docs_images/full_view.png)

## Capture types
- Capture Sprite
    - It takes an image perferctly aligned to the sprite texture (rect)
- Capture Box
    - [**Check this!**](#try-to-center-important) If you are using TextureRect
    - It uses TextureRect
    - It uses the rect of the box to take an image
- Custom Capture Box
    - Basically the same as **Capture Box** but you can enter your custom node with rect
- Capture Rect
    - If you don't want to use node, to select an area. You can do it from the code

### Capture Type
- Select what type do you want to use. **Remember** to set the specific capture type, so it won't result in an error

## Offset
- You can offset the camera, so the texture will be offset

### Offset settings

#### Try to center ***(Important!)***
- If you are using anything than sprite2D, you would probably need to turn this on.

#### Use node pivot offset
- If your node has some sort of offset (Pivot offset or offset), you can apply it.

# How to get image
- You can reference NodePreview and then call ```.get_image()``` from it
    - It will return **Image** not **ImageTexture** used for sprites2D, TextureRect etc.
    - If you want to convert from **Image** to **ImageTexture** you need to do it like this:
    - ```var texture: = ImageTexture.create_from_image(image)```
- Example:
    ![](docs_images/how_to.png)

# Custom Camera2D and SubViewport 
***For more advanced users***
This plugin uses Camera2D and SubViewport to take images of your textures. If
You need to change some things, you can set custom Camera2D or custom SubViewport. You **don't**
need to to it manually, the NodePreview, does this itself. But if you need to use custom settings,
your Camera2D and SubViewport should be in that specific order like this:
1. ![](docs_images/only_camera.png)
Or
2. ![](docs_images/only_subviewport.png)
Or
3. ![](docs_images/both.png)

# Contact and Collaboration
If you want to help, feel free to clone the project and make some changes.
If you need more help, or maybe you need to contact me, you can contact me here, on the Github, or on Discord.
My name on discord is: .susdog

# Future updates
I'm not abandoning this project yet, it's simple so the updates are also simple to do.
This is the list of things I would like to add:
- 3D support (Camera3D support etc.)
- more image manipulation options
    - Expand Margins
    - Border Width
