# ColorizedApp

Приложение, в котором можно менять цвет фона у вью при помощи слайдеров или текстовых полей.

Значение каждого слайдера отображается в соответствующем лейбле и текстовом поле.

Цвет слайдера слева от бегунка соответствует тому цвету, за который он отвечает.

При нажатии на кнопку настроек открывается экран с настройками для цвета стартового экрана.

Цвет вью можно установить при помощи слайдеров и текстовых полей, для работы с текстовыми полями используется протокол UITextFieldDelegate.

Значение слайдеров передаются одновременно в лейбл, текстовое поле и меняют цвет вью.

<img width="514" alt="image" src="https://user-images.githubusercontent.com/114927709/215287647-9ac55b1d-07d5-4bc7-be7b-5a570af1bc26.png">

При тапе на текстовое поле открывается цифровая клавиатура с кнопкой "Done".

При тапе на кнопку "Done" или мило клавиатуры - клавиатура скрывается, а введенное значение применяется к слайдеру.

<img width="514" alt="image" src="https://user-images.githubusercontent.com/114927709/215287663-9b586742-b5a6-4ca4-b6f9-21d9925eb1c1.png">

При нажатии на кнопку "Done" цвет вью из настроект передается на главный экран