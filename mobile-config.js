App.info({
  name: 'MyPikin',
  description: ' Mypikin is a maternal health financial service app that seeks to reduce maternal mortality on a global scale by helping women prepay towards delivery cost while receiving tailored maternal health information.',
  version: '0.0.1'
});

App.setPreference('SplashScreen', 'resources/splash/splash-480x800');
App.icons({
  // Android
  // 'android_ldpi': 'resources/icons/icon-36x36.png',
  'android_mdpi': 'resources/icons/icon-48x48.png'
});

App.setPreference('Orientation', 'portrait');
App.setPreference('Orientation', 'portrait', 'ios');

App.launchScreens({

  // 'ipad_portrait': 'resources/splash/splash-768x1024.png',
  // 'ipad_portrait_2x': 'resources/splash/splash-768x1024@2x.png',
  // 'ipad_landscape': 'resources/splash/splash-1024x768.png',
  // 'ipad_landscape_2x': 'resources/splash/splash-1024x768@2x.png',

  // Android
  // 'android_ldpi_portrait': 'resources/splash/splash-200x320.png',
  // 'android_ldpi_landscape': 'resources/splash/splash-320x200.png',
  // 'android_mdpi_portrait': 'resources/splash/splash-320x480.png',
  // 'android_mdpi_landscape': 'resources/splash/splash-480x320.png',
  'android_hdpi_portrait': 'resources/splash/splash-480x800.png'
  // 'android_hdpi_landscape': 'resources/splash/splash-800x480.png',
  // 'android_xhdpi_portrait': 'resources/splash/splash-720x1280.png',
  // 'android_xhdpi_landscape': 'resources/splash/splash-1280x720.png'
});