# candidate_app

before run app or test, please run this command
```flutter pub run build_runner build --delete-conflicting-outputs```

# Answer
- What kind of architecture did you use?
  - it called TDD (Test Driven Design)
- What libraries did you add to the app? What are they used for? if you not rely the other library tell us why?
  - i am using so many library that to much to describe it one by one. But i will explain the main one. such as:
    - `dartz` for using left-right value
    - `flutter_bloc` for handle state management
    - `freezed` for create sealed class
    - `dio` for http client
    - `auto route` for navigating each page
    - `injectable & getIt` for injection
    - `mockito` for generate mock class
    - `url_launcher` for launch to external app
- How long did you spend on the test?
  - about 18 hours
- If you had more time, what further improvements or new features would you add?
  - create a centrap app theme, for colors, text, etc
- Which parts of your submission are you most proud of? And why? little advice, dont answer whole project, use one what you think it special.
  - the folder structure and the code itself. The code in every class or widget has small line and it separate to another file or widget. Because it will help in the future for maintain the code
- Which parts did you spend the most time with? What did you find most difficult?
  - `unit test` because unit testing will help other programmer to understand what the function is about and to make sure that function run as it should be.
- How did you find the test overall? If you have any suggestions on how we can improve the test or our API, we'd love to hear them, please elaborate more about this.
  - the test is good. it cover how to call API data and display it. If i can give a suggestion, try to cover CRUD more.
- The last question, quality or quantity?
  - quality