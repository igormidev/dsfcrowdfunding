# Git hub page site
This branch is used to put all files of the site. Those files will be used by github to build the crowdfunding site. 

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

# HTML Video loader configuration
In order to run m3U8 video type in flutter web we need to do some configurations.
Those configurations are `already done` in `dsfcrowdfunding_site_generator`. 
But I am writing a documentation here about how to it.

Inside the root of the flutter project, look for `/web`.
Then, open `index.html` file.
In the body section, you can add scripts.
Add the following script *as the last script of body section*:
```dart
<script>
function replaceUrl(url) {
  history.replaceState(null, "", url);
}
function playHls(id, videoSrc) {
  var video = document.getElementById("video");
  if (video == null) {
    return;
  }
  if (video.canPlayType("application/vnd.apple.mpegurl")) {
    video.src = videoSrc;
    video.addEventListener("loadedmetadata", function () {
      video.volume = 0.3;
    });
  } else if (Hls.isSupported()) {
    var hls = new Hls();
    hls.loadSource(videoSrc);
    hls.attachMedia(video);
    hls.on(Hls.Events.MANIFEST_PARSED, function () {
      video.volume = 0.3;
    });
  } else {
    console.error("HLS is not supported");
    alert("HLS is not supported");
  }
} 
function playBlob(id, videoSrc) {
  var video = document.shadowRoot.getElementById("video");
  if (video == null) {
    return;
  }
  var url = URL.createObjectURL(videoSrc);
  video.src = url;
}
</script> 
```