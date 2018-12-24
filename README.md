# CapitalSocial

## Project Architecture.

https://drive.google.com/file/d/1T4F9m72KgkwEPiREvhl0TjRr569LIiYy/view?usp=sharing

## Patterns in this Project 

- Factory
- Singleton

## Third Party Frameworks

- SwiftKeychainWrapper
- SDWebImage
- QRCodeReader

## Screenshots

| Launch Screen | Log in | Promotions |
| --- | --- | --- |
| <img width="438" alt="launch" src="https://user-images.githubusercontent.com/6865674/50407572-871c3000-078f-11e9-9aee-3c8212f40a4e.png"> | <img width="438" alt="login" src="https://user-images.githubusercontent.com/6865674/50407573-8aafb700-078f-11e9-8bfe-42333f025625.png"> | <img width="438" alt="promociones" src="https://user-images.githubusercontent.com/6865674/50407574-8daaa780-078f-11e9-8e36-8adf749562cd.png"> |


| Detail View | Share | Map View |
| --- | --- | --- |
| <img width="438" alt="detalle" src="https://user-images.githubusercontent.com/6865674/50407578-956a4c00-078f-11e9-82f6-e71759a0bf5a.png"> | <img width="438" alt="compartir" src="https://user-images.githubusercontent.com/6865674/50407581-9bf8c380-078f-11e9-91f4-ac08a5e37438.png"> | <img width="438" alt="mapa" src="https://user-images.githubusercontent.com/6865674/50407582-a31fd180-078f-11e9-9dbc-fbd7fdea38eb.png"> |


## Notes.

For this project I'm using this temporary Json Local file to retrieve all the available promotions, I'm getting the promotions in this format:

```
{
	"ideaInterior": {
		"title": "Idea Interior",
		"imageUrl": "https://2.bp.blogspot.com/_gKQeWzIzN3c/TVVs3AT8CpI/AAAAAAAAABQ/7tVSZWvFS_E/s1600/Color+Scheme+Types+-+IDEA+INTERIOR+DESIGN+%25286%2529.jpg",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in tortor non lorem mattis malesuada. Cras a lorem tristique, tincidunt dui id, molestie justo. Nam convallis risus euismod felis dignissim placerat. Nunc mollis sagittis ultricies. Aliquam ut placerat leo. In at tortor ut felis eleifend feugiat suscipit eu justo. Duis at dolor gravida, vestibulum orci id, aliquet est. Duis lobortis lorem eget consequat volutpat. Sed ut nunc sed magna varius dapibus ut ut ipsum. Donec et rhoncus elit. In ultricies pharetra augue, id posuere nulla. Integer eu ornare tellus. Aenean volutpat hendrerit neque, id varius nunc ornare faucibus. Integer cursus molestie leo, eget malesuada eros hendrerit dictum. Ut nisi ipsum, volutpat eu imperdiet eleifend, tristique eu turpis."
	}
}
```













