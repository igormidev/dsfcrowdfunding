# DSF  Crowdfunding
A package to display a DSF crowdfunding screen. 

This package has the intent to be used in two places:
- In the DSF app. As a package so an user of the app can access it inside the profile page of a user that has a crowdfunding.
- In the DSF crowdfunding web-aplication. A micro-site just to show the crowdfunding.

# Integrations how-to-do
* See the `README` about how the full comunication between app-api's will work in a sequence diagram by [clicking here](https://github.com/igormidev/dsfcrowdfunding.github.io/blob/master/docs/API_INTEGRATION_README.md)
* See the `README` about how to integrate with mercado pago rest api by [clicking here](https://github.com/igormidev/dsfcrowdfunding.github.io/blob/master/docs/PIX_INTEGRATION_README.md)

# How to use package in a flutter project

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

## Initial Configuration
Follow this if the repository is not configured.

⚠️ Ensure everthing is right

- 1.  Inside the repository, click in settings 
- 2. Verify that the name of the repository is `dsfcrowdfunding.github.io`
- 3. Go to "Pages"
- 4. Click in "Deploy from branch"
- 5. Select the branch GH-PAGES
- 6. Verify the folder is `/(root)`

Done! Evertime you upload some code something in the branch GH-PAGES a new version of the website will be uploaded. 

![name refactor](https://github.com/igormidev/dsfcrowdfunding.github.io/blob/master/docs/images/name_refactor.png?raw=true)

![deploy section](https://github.com/igormidev/dsfcrowdfunding.github.io/blob/master/docs/images/deploy_section.png?raw=true)

## Upload new version

After commited all changes in the master branch, change to branch [GH-PAGES](https://github.com/igormidev/dsfcrowdfunding.github.io/tree/GH-PAGES).

Inside that repo, run `flutter pub get` to get the new version of the package with the modifications you made.<br>
⚠️ Notice: The yaml will always look for the version in the main branch.

Inside the branch, go to `dsfcrowdfunding_site_generator` folder. That is a flutter project that uses the package.
Now, you can generate a new version of the site with `flutter build web`.

The project will be generated inside `build/web`.
But that web folder needs to be inside the root folder.
So you can drag all content inside build/web to the root of this branch.

After that, just commit the changes and wait 5 minutes and a new version of the website will be availible.