'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"main.dart.js_258.part.js": "7231ab76087c3199aa9ade42ff17a4d6",
"main.dart.js_248.part.js": "7676671ef96595a257d736a5cf550db5",
"main.dart.js_283.part.js": "89085d18352be0e9c09f37c37297ee75",
"main.dart.js_293.part.js": "86de2645a0a505ecacf79d075f6e5a9c",
"flutter_bootstrap.js": "8d3536ee85e72659279860fb9ec36ee4",
"main.dart.js_267.part.js": "d09fa995660393fb815f6eaf6df09cf3",
"main.dart.js_277.part.js": "8110381d21e6227d1a289649e0a15155",
"version.json": "bc3b87f793eeea60cf87f1e8a9766883",
"main.dart.js_233.part.js": "c05d7444bcd89a87f61210c2f509992b",
"splash/img/light-2x.png": "48261721c0b4c383d8ee0925fbd350c6",
"splash/img/dark-4x.png": "48261721c0b4c383d8ee0925fbd350c6",
"splash/img/light-3x.png": "48261721c0b4c383d8ee0925fbd350c6",
"splash/img/dark-3x.png": "48261721c0b4c383d8ee0925fbd350c6",
"splash/img/light-4x.png": "48261721c0b4c383d8ee0925fbd350c6",
"splash/img/dark-2x.png": "48261721c0b4c383d8ee0925fbd350c6",
"splash/img/dark-1x.png": "48261721c0b4c383d8ee0925fbd350c6",
"splash/img/light-1x.png": "48261721c0b4c383d8ee0925fbd350c6",
"splash/style.css": "740c493f9c5dfc859ca07663691b24fb",
"index.html": "7b37860eb716e23fc986e26c53f063d8",
"/": "7b37860eb716e23fc986e26c53f063d8",
"main.dart.js_249.part.js": "65f1fc6cb254e61e599fc1759ea22ed4",
"main.dart.js_292.part.js": "e6908e1312c0e51b63b1a8cdd0d180c8",
"main.dart.js_276.part.js": "217595c840315f4ecb0fc254b337840b",
"auth.html": "f006eadf6aacca05216e007f230cc7d7",
"main.dart.js_214.part.js": "cded4a4185887a9a33852e71ca6ba2ae",
"main.dart.js_242.part.js": "c865398745f876f2d26da800746f0485",
"main.dart.js_252.part.js": "801dc69f2aba3924fa502ee8fd551384",
"main.dart.js_299.part.js": "922ea82dd164d05fff8a7b7f16bc649d",
"main.dart.js": "d6eccbfbb2c8d0bf0120cb88a20dc8e1",
"main.dart.js_280.part.js": "17538a25dbcfc99f3a97227f1658673f",
"main.dart.js_290.part.js": "430b2362d04745c0c858e3cc0b803849",
"main.dart.js_264.part.js": "0d1be1af2a552bc16417ed57271df734",
"main.dart.js_274.part.js": "008a23e573e7c4d07ee67211925f2579",
"main.dart.js_291.part.js": "ff2c338f3d97a536ebb622ebfd03ad88",
"main.dart.js_281.part.js": "f10d35df378f819319bad2bbf0de158b",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"main.dart.js_265.part.js": "e3fbacecd117597ccbe707da53b40650",
"main.dart.js_253.part.js": "5fa9f5c159d92d7ee6bde31560512963",
"main.dart.js_298.part.js": "0073397990fb826e2e30e4ebc8a80681",
"main.dart.js_221.part.js": "87ada5368e88d0f7641bdb059ed79c32",
"main.dart.js_279.part.js": "50473e17cc26b86def3b6c715b3ef3e2",
"main.dart.js_246.part.js": "5d6d62adbb049c8007e780238cb0ab0f",
"main.dart.js_256.part.js": "b89f23d8481fdb6f746b1baeb8f2d4da",
"main.dart.js_15.part.js": "a66674596bd939772d781359c693e7f9",
"main.dart.js_199.part.js": "fba62ec4b3dc19af410ccc4f60ee4360",
"main.dart.js_234.part.js": "1e0170dff8f9f57cfae8755180680efd",
"favicon.png": "48261721c0b4c383d8ee0925fbd350c6",
"main.dart.js_212.part.js": "a2b96ee8a5bab4015a06856d04247279",
"main.dart.js_284.part.js": "05406c3ac9bab46f8e3167bfd86f7ec3",
"main.dart.js_213.part.js": "9a8c9b72250e4dd60d3f2db508909060",
"main.dart.js_295.part.js": "2dbab0b03bf1679b997be3f85cf77c12",
"icons/Icon-192.png": "48261721c0b4c383d8ee0925fbd350c6",
"icons/Icon-512.png": "48261721c0b4c383d8ee0925fbd350c6",
"main.dart.js_285.part.js": "1d48ade50b77c3809c5744805c81de4b",
"PWA/flutter_bootstrap.js": "c7f3853a5f33d3712272c5637c37db56",
"PWA/version.json": "9cbe4c9ca2f8e945080931b1f54d28bd",
"PWA/splash/img/light-2x.png": "48261721c0b4c383d8ee0925fbd350c6",
"PWA/splash/img/dark-4x.png": "48261721c0b4c383d8ee0925fbd350c6",
"PWA/splash/img/light-3x.png": "48261721c0b4c383d8ee0925fbd350c6",
"PWA/splash/img/dark-3x.png": "48261721c0b4c383d8ee0925fbd350c6",
"PWA/splash/img/light-4x.png": "48261721c0b4c383d8ee0925fbd350c6",
"PWA/splash/img/dark-2x.png": "48261721c0b4c383d8ee0925fbd350c6",
"PWA/splash/img/dark-1x.png": "48261721c0b4c383d8ee0925fbd350c6",
"PWA/splash/img/light-1x.png": "48261721c0b4c383d8ee0925fbd350c6",
"PWA/splash/style.css": "52986a9e1d69ad779d02334a06b33a81",
"PWA/index.html": "d47c72903acb86c388c9879acdecf0ca",
"PWA/auth.html": "70705fe3f93b167ef03ab76babb55579",
"PWA/flutter.js": "f393d3c16b631f36852323de8e583132",
"PWA/favicon.png": "48261721c0b4c383d8ee0925fbd350c6",
"PWA/icons/Icon-192.png": "48261721c0b4c383d8ee0925fbd350c6",
"PWA/icons/Icon-512.png": "48261721c0b4c383d8ee0925fbd350c6",
"PWA/manifest.json": "fc90fe81472ab2b0bdce9a52b323f697",
"PWA/assets/AssetManifest.json": "fbe05848f27b72e2840233d02e8f8769",
"PWA/assets/NOTICES": "1908ab902bb2609959ffa194d5c5597d",
"PWA/assets/FontManifest.json": "1114a5860d5e995c8dc48419a7a6a9e7",
"PWA/assets/AssetManifest.bin.json": "302f3858dc62caef329f43b95205dc33",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_AMS-Regular.ttf": "657a5353a553777e270827bd1630e467",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Script-Regular.ttf": "55d2dcd4778875a53ff09320a85a5296",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size3-Regular.ttf": "e87212c26bb86c21eb028aba2ac53ec3",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Typewriter-Regular.ttf": "87f56927f1ba726ce0591955c8b3b42d",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Caligraphic-Bold.ttf": "a9c8e437146ef63fcd6fae7cf65ca859",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Bold.ttf": "ad0a28f28f736cf4c121bcb0e719b88a",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Bold.ttf": "9eef86c1f9efa78ab93d41a0551948f7",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Fraktur-Regular.ttf": "dede6f2c7dad4402fa205644391b3a94",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Regular.ttf": "5a5766c715ee765aa1398997643f1589",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Italic.ttf": "d89b80e7bdd57d238eeaa80ed9a1013a",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Math-Italic.ttf": "a7732ecb5840a15be39e1eda377bc21d",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Italic.ttf": "ac3b1882325add4f148f05db8cafd401",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Fraktur-Bold.ttf": "46b41c4de7a936d099575185a94855c4",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size2-Regular.ttf": "959972785387fe35f7d47dbfb0385bc4",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Regular.ttf": "b5f967ed9e4933f1c3165a12fe3436df",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size1-Regular.ttf": "1e6a3368d660edc3a2fbbe72edfeaa85",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Caligraphic-Regular.ttf": "7ec92adfa4fe03eb8e9bfb60813df1fa",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size4-Regular.ttf": "85554307b465da7eb785fd3ce52ad282",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-BoldItalic.ttf": "e3c361ea8d1c215805439ce0941a1c8d",
"PWA/assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Math-BoldItalic.ttf": "946a26954ab7fbd7ea78df07795a6cbc",
"PWA/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "bf619178a1771fb6a056dd98bc108d5d",
"PWA/assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"PWA/assets/packages/record_web/assets/js/record.fixwebmduration.js": "69150c1e790ef4278f83d60a4e8c5bb4",
"PWA/assets/packages/record_web/assets/js/record.worklet.js": "007de35b5784ecd58f7f748394899229",
"PWA/assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"PWA/assets/packages/handy_window/assets/handy-window-dark.css": "45fb3160206a5f74c0a9f1763c00c372",
"PWA/assets/packages/handy_window/assets/handy-window.css": "0434ee701235cf1c72458fd4ce022a64",
"PWA/assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"PWA/assets/AssetManifest.bin": "7d6aa8202bf3807d3997bf45e65390fc",
"PWA/assets/fonts/NotoEmoji/NotoColorEmoji.ttf": "ed84f46d3d5564a08541cd64bddd495c",
"PWA/assets/fonts/Roboto/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"PWA/assets/fonts/Roboto/RobotoMono-Regular.ttf": "7e173cf37bb8221ac504ceab2acfb195",
"PWA/assets/fonts/Roboto/Roboto-Italic.ttf": "cebd892d1acfcc455f5e52d4104f2719",
"PWA/assets/fonts/Roboto/Roboto-Bold.ttf": "b8e42971dec8d49207a8c8e2b919a6ac",
"PWA/assets/fonts/MaterialIcons-Regular.otf": "43916d53bcb4e7a549ee7d84a1d11bc2",
"PWA/assets/assets/sas-emoji.json": "b9d99fc6dda6a3250af57af969b4a02d",
"PWA/assets/assets/verification.png": "cfafe6d01ed9f2b08312157bc2fd36d3",
"PWA/assets/assets/info-logo.svg": "43c10a9c1d2b93adcf9094921efaf8d7",
"PWA/assets/assets/colors.png": "fde0db0023d9fc4b7c96a8114e9329bb",
"PWA/assets/assets/encryption.png": "85367d8a3630d5791124f10a63e7f9d1",
"PWA/assets/assets/favicon.ico": "6b9e5364fb61db4cc92f060b786cf39e",
"PWA/assets/assets/Desktop.png": "abd0f5584d395ee024489a15740b06ef",
"PWA/assets/assets/banner.png": "d8530428e6dac762a4a237405cc9b4f5",
"PWA/assets/assets/typing.svg": "fac23aaad793ddae0aae89dc7f8bd843",
"PWA/assets/assets/banner_dark.png": "328e91966330c66945eae2101e16f0b6",
"PWA/assets/assets/info-logo.png": "acdd9392ed48469370a2891845a4b2d8",
"PWA/assets/assets/login_wallpaper.png": "020c41db8a3f4f56c27239e72da4b05e",
"PWA/assets/assets/login_wallpaper.jpg": "75704441486c31340a1240a81fa00468",
"PWA/assets/assets/banner_transparent.png": "441a7e2600384cead5c5a600808a4bc3",
"PWA/assets/assets/backup.png": "9c1f3ddbb59cee5be2c72ae4eabead1e",
"PWA/assets/assets/sounds/notification.ogg": "d928d619828e6dbccf6e9e40f1c99d83",
"PWA/assets/assets/sounds/phone.ogg": "5c8fb947eb92ca55229cb6bbf533c40f",
"PWA/assets/assets/sounds/call.ogg": "7e8c646f83fba83bfb9084dc1bfec31e",
"PWA/assets/assets/favicon.png": "6debb4449a6d5b75cd87b5b162e496a4",
"PWA/assets/assets/chat.svg": "489ddcc0ff4f35ab0243ca6dd1b7b759",
"PWA/assets/assets/logo.png": "48261721c0b4c383d8ee0925fbd350c6",
"PWA/assets/assets/share.png": "6d8b7e3179bea3d8b7ea1287594289bd",
"PWA/assets/assets/typing.gif": "c64522db9f8f84611d53b0e4ba5fee4e",
"PWA/assets/assets/logo.svg": "a98db77c6e45116197998296ee4955d7",
"PWA/canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"PWA/canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"PWA/canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"PWA/canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"PWA/canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"PWA/canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"PWA/canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"PWA/canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"PWA/canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"PWA/canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"manifest.json": "9b3dc5c3bba386ed98b0c85bdd91f094",
"main.dart.js_300.part.js": "9bb3e9ee4a7a3934e7259da8271f8cb7",
"main.dart.js_278.part.js": "fec98834f131e0cfca92b50f03db5b1e",
"main.dart.js_257.part.js": "46dcb6d9ca47229aa077a842759c4386",
"main.dart.js_247.part.js": "ab7f4f3f508a9c93c951a91dce792c9f",
"main.dart.js_235.part.js": "b109f9b8db135921afd6d0ff70067bff",
"main.dart.js_1.part.js": "4fe9de02c5f37adb16e461a471c9f9f2",
"main.dart.js_201.part.js": "d9fae638b8332df9e4382d2a58de7aa9",
"main.dart.js_297.part.js": "fc4693bae8fed68b67b7a84ab2ef86d1",
"main.dart.js_237.part.js": "f54133e719d28f7ba8cedc310fe1d2ba",
"assets/AssetManifest.json": "cccf8071d6c252e22b63130294dedf70",
"assets/NOTICES": "933506382dc7b9cb9547b3f031d4061c",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "45a9fa69df3cad9d25082724ed0e583a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "04bc91744b625a64b095c6aec2f83ed9",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/packages/record_web/assets/js/record.fixwebmduration.js": "1f0108ea80c8951ba702ced40cf8cdce",
"assets/packages/record_web/assets/js/record.worklet.js": "356bcfeddb8a625e3e2ba43ddf1cc13e",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/packages/handy_window/assets/handy-window-dark.css": "45fb3160206a5f74c0a9f1763c00c372",
"assets/packages/handy_window/assets/handy-window.css": "0434ee701235cf1c72458fd4ce022a64",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "ef5584a12449fe30a27062cda1d116d5",
"assets/fonts/MaterialIcons-Regular.otf": "327a94db42bde357e78c2381440375fb",
"assets/assets/logo_transparent.png": "48261721c0b4c383d8ee0925fbd350c6",
"assets/assets/sas-emoji.json": "b9d99fc6dda6a3250af57af969b4a02d",
"assets/assets/verification.png": "cfafe6d01ed9f2b08312157bc2fd36d3",
"assets/assets/info-logo.svg": "43c10a9c1d2b93adcf9094921efaf8d7",
"assets/assets/colors.png": "fde0db0023d9fc4b7c96a8114e9329bb",
"assets/assets/encryption.png": "85367d8a3630d5791124f10a63e7f9d1",
"assets/assets/favicon.ico": "6b9e5364fb61db4cc92f060b786cf39e",
"assets/assets/Desktop.png": "7511c992ee81cdc02eb9ba540ff6a618",
"assets/assets/Desktop.jpg": "958a0fe0551da2badf880c27bc638fcc",
"assets/assets/banner.png": "d8530428e6dac762a4a237405cc9b4f5",
"assets/assets/typing.svg": "fac23aaad793ddae0aae89dc7f8bd843",
"assets/assets/banner_dark.png": "328e91966330c66945eae2101e16f0b6",
"assets/assets/info-logo.png": "acdd9392ed48469370a2891845a4b2d8",
"assets/assets/login_wallpaper.png": "7511c992ee81cdc02eb9ba540ff6a618",
"assets/assets/login_wallpaper.jpg": "958a0fe0551da2badf880c27bc638fcc",
"assets/assets/banner_transparent.png": "441a7e2600384cead5c5a600808a4bc3",
"assets/assets/backup.png": "9c1f3ddbb59cee5be2c72ae4eabead1e",
"assets/assets/sounds/notification.ogg": "d928d619828e6dbccf6e9e40f1c99d83",
"assets/assets/sounds/phone.ogg": "5c8fb947eb92ca55229cb6bbf533c40f",
"assets/assets/sounds/call.ogg": "7e8c646f83fba83bfb9084dc1bfec31e",
"assets/assets/favicon.png": "6debb4449a6d5b75cd87b5b162e496a4",
"assets/assets/chat.svg": "489ddcc0ff4f35ab0243ca6dd1b7b759",
"assets/assets/logo.png": "48261721c0b4c383d8ee0925fbd350c6",
"assets/assets/share.png": "6d8b7e3179bea3d8b7ea1287594289bd",
"assets/assets/typing.gif": "c64522db9f8f84611d53b0e4ba5fee4e",
"assets/assets/logo.svg": "a98db77c6e45116197998296ee4955d7",
"main.dart.js_226.part.js": "100b308dff0bd31f409b63378e005104",
"main.dart.js_2.part.js": "5384bd8c9a26a9ae7fd3c266a801db43",
"main.dart.js_244.part.js": "b5496f4c75eb8a058cf73cc5fbeff774",
"main.dart.js_272.part.js": "3631ae242aa3a5afb275db0f22735d31",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"main.dart.js_296.part.js": "f2b22e286a8ae34d6e29dfa1f8f91fa3",
"main.dart.js_286.part.js": "b53ee93aebef4b1d487fb9d3f489da04"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
