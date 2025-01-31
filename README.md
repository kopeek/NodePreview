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
    - [SubViewport](#custom-camera2d-and-subviewport)
    - [Camera](#custom-camera2d-and-subviewport)


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

# Custom Camera2D and SubViewport 
***For more advanced users***
This plugin uses Camera2D and SubViewport to take images of your textures. If
You need to change some things, you can set custom Camera2D or custom SubViewport. You **don't**
need to to it manually, the NodePreview, does this itself. But if you need to use custom settings,
your Camera2D and SubViewport should be in that specific order like this:
![](docs_images/only_camera.png)
Or
![](docs_images/only_subviewport.png)
Or
![](docs_images/both.png)