# GithubUsers
Fetch github users

# TASK
The goal is to create a simple iOS application which makes a request to an API, parses the response, and displays the result in the UI. The app will consist of three main components: 1. A search component that will have: a. A TextView input for entering a String value b. A ‘Search’ Button to initiate a request to: https://api.github.com/search/users?q={searchQuery}, where {searchQuery} is the TextView input value 2. A results component for displaying the results of the user search. The result response must have the following nodes: a. login b. avatar_url c. Type Use pagination and display 10 items per_page. The results must be sorted alphabetically by ‘login’. Please reference the Github docs: https://docs.github.com/en/rest/search#search-users 3. A detail component that is presented when a result item is tapped on The user interface should appear modern and simple while following best practices around iOS UI.

# Requirements
- iOS ~> 13
- Xcode ~> 13 (13 compatible)
- Swift ~> 4.2

# Installation
Clone the repository
```sh
$ git clone https://github.com/OBaller/GithubUsers.git
$ cd GithubUsers
```
# Support
- Dark Mode Support

# Dependency
- SDWebImage: A third party library for fetching images from URL

### DESCRIPTION
The App fetches and displays the homescreen content from "https://api.github.com/users" and displays results, 10 items per page and more are being loaded automatically as the user scrolls down the screen.

The search feature: The search bar displays contents from "https://api.github.com/search/users" as the text in the search bar changes.

### Loading View
<img width="282" alt="Auth" src="https://user-images.githubusercontent.com/60821645/169313178-fcea00a0-b7d5-4670-b238-234698fe2eb8.png">

### HomeView
<img width="282" alt="Auth" src="https://user-images.githubusercontent.com/60821645/169314316-5e47fad6-048a-48d3-8cf2-cd78d4d9a947.png"> <img width="282" alt="Auth" src="https://user-images.githubusercontent.com/60821645/169314349-ef3abcfd-d29e-4105-a637-c9c2e4ddc30f.png">


### Search Feature
<img width="282" alt="Auth" src="https://user-images.githubusercontent.com/60821645/169317914-f915429b-82c2-4d4e-b014-e9dfecd581d8.png"> <img width="282" alt="Auth" src="https://user-images.githubusercontent.com/60821645/169317968-8a901389-0065-4cd5-a0dc-5d63899461a7.png"> <img width="282" alt="Auth" src="https://user-images.githubusercontent.com/60821645/169317978-edbfe676-c601-465f-b156-7b23be9abddb.png">

<img width="282" alt="Auth" src="https://user-images.githubusercontent.com/60821645/169317988-1c131c0c-a6d5-4e94-8c52-e944d7274f4b.png">  <img width="282" alt="Auth" src="https://user-images.githubusercontent.com/60821645/169317995-ece344fe-292c-4f30-a238-db5329724b8c.png">



