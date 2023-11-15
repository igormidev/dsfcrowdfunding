# DSF  Crowdfunding
A package to display a DSF crowdfunding screen. 

This package has the intent to be used in two places:
- In the DSF app. As a package so an user of the app can access it inside the profile page of a user that has a crowdfunding.
- In the DSF crowdfunding web-aplication. A micro-site just to show the crowdfunding.


# How to use

In order to use this package, import it in you'r flutter yaml: 
```yaml
  dsfcrowdfunding:
    git:
      url: https://github.com/igormidev/dsfcrowdfunding.git
```

Then, use the initial crowdfunding screen:

```dart
CrownfundingModule(
    ...
)
```

Then, pass the parameters needed to mounth the screen.

# How to deploy the website in GITHUB PAGES

This is a brief/short tutorial about how to deploy a flutter site to [github page](https://pages.github.com/). 

## Configuration
Follow this if the repository is not configured.

⚠️ Ensure everthing is right

- 1.  Inside the repository, click in settings 
- 2. Verify that the name of the repository is `dsfcrowdfunding.github.io`
- 3. Go to "Pages"
- 4. Click in "Deploy from branch"
- 5. Select the branch GH-PAGES
- 6. Verify the folder is `/(root)`

Done! Evertime you upload some code something in the branch GH-PAGES a new version of the website will be uploaded.
