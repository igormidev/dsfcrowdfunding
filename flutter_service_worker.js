'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "fd836f98838196d78582e5fb38ccbe24",
"index.html": "d2c0b62599337b6138fce443133cb489",
"/": "d2c0b62599337b6138fce443133cb489",
"main.dart.js": "53244f05fb9e56d2ce4bc99bab4426ad",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "2cdf2278fc4c71848e9a8fde55f0ef32",
"icons/Icon-192.png": "8d330244d1befd4aba5863f425b04cd0",
"icons/Icon-maskable-192.png": "8d330244d1befd4aba5863f425b04cd0",
"icons/Icon-maskable-512.png": "58265dfa2ea1defb62ae92b44ed861b0",
"icons/Icon-512.png": "58265dfa2ea1defb62ae92b44ed861b0",
"manifest.json": "e6122ad0c192402f8a4e760d8a699c38",
"assets/AssetManifest.json": "6b7e66fcb3f47d178aa89fc2b7babb3b",
"assets/NOTICES": "399ce77121613b7f8afe40507fbcce30",
"assets/FontManifest.json": "4ac51251e3bbf1bf2d8468729ad536af",
"assets/AssetManifest.bin.json": "12588bec717fb59db258935aad32abd2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "f2163b9d4e6f1ea52063f498c8878bb9",
"assets/packages/dsfcrowdfunding/assets/images/like_icon.svg": "228f80f7a947f25a9e266312811d4909",
"assets/packages/dsfcrowdfunding/assets/images/logo.svg": "4248cc9c711ebd074f556e0481d5a69f",
"assets/packages/dsfcrowdfunding/assets/images/comment_icon.svg": "ae712707f5cdcf3f474f7282386e4c10",
"assets/packages/dsfcrowdfunding/assets/fonts/MangoGrotesque/MangoGrotesque-SemiBold.ttf": "a94921ab6eb30479b093d19f838c7820",
"assets/packages/dsfcrowdfunding/assets/fonts/MangoGrotesque/MangoGrotesque-Bold.ttf": "c9f69f6952f01dfc8e51ebaca133ef07",
"assets/packages/dsfcrowdfunding/assets/fonts/MangoGrotesque/MangoGrotesque-Regular.ttf": "ee804185d33fa97f5ecd653182ccf84e",
"assets/packages/dsfcrowdfunding/assets/fonts/Archivo/Archivo-Regular.ttf": "a27e3f0471a07766ddc6b9b4290d43f1",
"assets/packages/dsfcrowdfunding/assets/fonts/Archivo/Archivo-Black.ttf": "b68e94819a323e1c73c330d9eb49109b",
"assets/packages/dsfcrowdfunding/assets/fonts/Archivo/Archivo-SemiBold.ttf": "90e1bc7b6b625a4409bbf90be6683d69",
"assets/packages/dsfcrowdfunding/assets/fonts/Archivo/Archivo-Medium.ttf": "d0036c927d890c4f27b4308c7ee2db3d",
"assets/packages/dsfcrowdfunding/assets/fonts/Archivo/Archivo-ExtraLight.ttf": "792ad84cee3709c2e43bed786bea329c",
"assets/packages/dsfcrowdfunding/assets/fonts/Archivo/Archivo-Bold.ttf": "f2ecad8655556b2f3778773aecfa4ba2",
"assets/packages/dsfcrowdfunding/assets/fonts/Archivo/Archivo-ExtraBold.ttf": "9755fb5591fc45e8d6ab47e34949eb69",
"assets/packages/dsfcrowdfunding/assets/fonts/Archivo/Archivo-Light.ttf": "4f13f895ed655a257bca28117a346aca",
"assets/packages/dsfcrowdfunding/assets/fonts/Archivo/Archivo-Thin.ttf": "59daba4f64390577740914e1bfc4e400",
"assets/packages/flutter_credit_card/icons/discover.png": "62ea19837dd4902e0ae26249afe36f94",
"assets/packages/flutter_credit_card/icons/rupay.png": "a10fbeeae8d386ee3623e6160133b8a8",
"assets/packages/flutter_credit_card/icons/chip.png": "5728d5ac34dbb1feac78ebfded493d69",
"assets/packages/flutter_credit_card/icons/visa.png": "f6301ad368219611958eff9bb815abfe",
"assets/packages/flutter_credit_card/icons/hipercard.png": "921660ec64a89da50a7c82e89d56bac9",
"assets/packages/flutter_credit_card/icons/elo.png": "ffd639816704b9f20b73815590c67791",
"assets/packages/flutter_credit_card/icons/amex.png": "f75cabd609ccde52dfc6eef7b515c547",
"assets/packages/flutter_credit_card/icons/mastercard.png": "7e386dc6c169e7164bd6f88bffb733c7",
"assets/packages/flutter_credit_card/icons/unionpay.png": "87176915b4abdb3fcc138d23e4c8a58a",
"assets/packages/flutter_credit_card/font/halter.ttf": "4e081134892cd40793ffe67fdc3bed4e",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "f76c7cb4ed331ba5d704dc4734634741",
"assets/fonts/MaterialIcons-Regular.otf": "e407dad6484d1d0b467fcf9ce1a517d4",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "4124c42a73efa7eb886d3400a1ed7a06",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "f87e541501c96012c252942b6b75d1ea",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "64edb91684bdb3b879812ba2e48dd487",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
