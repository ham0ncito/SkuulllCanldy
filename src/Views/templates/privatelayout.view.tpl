<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{SITE_TITLE}}</title>
  <link rel="stylesheet" href="/{{BASE_DIR}}/node_modules/@splidejs/splide/dist/css/splide.min.css">
<link rel="stylesheet" href="/{{BASE_DIR}}/node_modules/normalize.css/normalize.css">

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
  <link rel="icon" href="/{{BASE_DIR}}/public/imgs/favicon/favicon.ico" type="image/x-icon">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
  
  <link rel="shortcut icon" href="/{{BASE_DIR}}/public/imgs/favicon/favicon.ico" type="image/x-icon">
  <script src="https://kit.fontawesome.com/{{FONT_AWESOME_KIT}}.js" crossorigin="anonymous"></script>
     <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
  <script src="anime.min.js"></script>
  {{foreach SiteLinks}}
    <link rel="stylesheet" href="/{{~BASE_DIR}}/{{this}}" />
  {{endfor SiteLinks}}
  {{foreach BeginScripts}}
    <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor BeginScripts}}
</head>

<body class="bg-black font-sans">
  <header class="bg-black-800 text-white py-4 flex items-center justify-between px-4">
    <nav id="menu" class="hidden md:block">
      <ul class="flex items-center space-x-4">
        <li><a href="index.php?page={{PRIVATE_DEFAULT_CONTROLLER}}" class="hover:text-gray-300">Inicio</a></li>
        {{foreach NAVIGATION}}
          <li><a href="{{nav_url}}" class="hover:text-gray-300">{{nav_label}}</a></li>
        {{endfor NAVIGATION}}
        <li><a href="index.php?page=sec_logout" class="hover:text-gray-300">Salir</a></li>
      </ul>
    </nav>
    {{with login}}
    <div class="flex items-center">
      <span class="text-lg mr-2">{{userName}}</span>
      <a href="index.php?page=sec_logout" class="hover:text-gray-300">
        <svg width="20px" height="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <circle cx="12" cy="6" r="4" stroke="#ffffff" stroke-width="1.5"></circle> <path d="M19.9975 18C20 17.8358 20 17.669 20 17.5C20 15.0147 16.4183 13 12 13C7.58172 13 4 15.0147 4 17.5C4 19.9853 4 22 12 22C14.231 22 15.8398 21.8433 17 21.5634" stroke="#ffffff" stroke-width="1.5" stroke-linecap="round"></path> </g></svg>
      </a>
  </div>
    {{endwith login}}
  </header>
  <main class="flex flex-wrap">
    <aside id="sidebar" class="bg-gray-800 text-white mx-4 rounded-lg w-10 mb-10 md:w-20">
        <button id="menuButton" class="block md:hidden">Show</button>
        <div class="flex justify-center flex-wrap items-center rounded-lg shadow-lg mt-5 mb-20">
          <div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <a> <svg width="40px" height="40px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="#f2f2f2"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M22 12.2039V13.725C22 17.6258 22 19.5763 20.8284 20.7881C19.6569 22 17.7712 22 14 22H10C6.22876 22 4.34315 22 3.17157 20.7881C2 19.5763 2 17.6258 2 13.725V12.2039C2 9.91549 2 8.77128 2.5192 7.82274C3.0384 6.87421 3.98695 6.28551 5.88403 5.10813L7.88403 3.86687C9.88939 2.62229 10.8921 2 12 2C13.1079 2 14.1106 2.62229 16.116 3.86687L18.116 5.10812C20.0131 6.28551 20.9616 6.87421 21.4808 7.82274" stroke="#ffffff" stroke-width="1.5" stroke-linecap="round"></path> <path d="M15 18H9" stroke="#ffffff" stroke-width="1.5" stroke-linecap="round"></path> </g></svg></div>
          <div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <svg width="40px" height="40px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M15.7955 15.8111L21 21M18 10.5C18 14.6421 14.6421 18 10.5 18C6.35786 18 3 14.6421 3 10.5C3 6.35786 6.35786 3 10.5 3C14.6421 3 18 6.35786 18 10.5Z" stroke="#fffafa" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg> </a>  </div>
         
<div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <a> <svg width="40px" height="40px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M8 6L21 6.00078M8 12L21 12.0008M8 18L21 18.0007M3 6.5H4V5.5H3V6.5ZM3 12.5H4V11.5H3V12.5ZM3 18.5H4V17.5H3V18.5Z" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg></a> </div>
        </div>
        <div class="m-2 p-2 rounded-full hover:bg-pink-500 transition duration-300 ease-in-out"> <a> <svg fill="#ffffff" width="40px" height="40px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" stroke="#ffffff"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M20.5,4.609A5.811,5.811,0,0,0,16,2.5a5.75,5.75,0,0,0-4,1.455A5.75,5.75,0,0,0,8,2.5,5.811,5.811,0,0,0,3.5,4.609c-.953,1.156-1.95,3.249-1.289,6.66,1.055,5.447,8.966,9.917,9.3,10.1a1,1,0,0,0,.974,0c.336-.187,8.247-4.657,9.3-10.1C22.45,7.858,21.453,5.765,20.5,4.609Zm-.674,6.28C19.08,14.74,13.658,18.322,12,19.34c-2.336-1.41-7.142-4.95-7.821-8.451-.513-2.646.189-4.183.869-5.007A3.819,3.819,0,0,1,8,4.5a3.493,3.493,0,0,1,3.115,1.469,1.005,1.005,0,0,0,1.76.011A3.489,3.489,0,0,1,16,4.5a3.819,3.819,0,0,1,2.959,1.382C19.637,6.706,20.339,8.243,19.826,10.889Z"></path></g></svg></a> </div>
      
    </aside>
    <section class="w-full md:w-2/3 flex-1 min-w-0">
        {{{page_content}}}
    </section>
   
</main>


<div class="relative max-w-screen">
  <!-- Contenido de la página -->
  
  <div class="bg-gray-900 p-4 h-20 fixed bottom-0 w-full">
    <!-- Reproductor de música -->
    <div class="flex items-center justify-between">
      <!-- Controles del reproductor -->
      <!-- Agrega aquí los controles del reproductor de música -->
    </div>
  </div>
</div>
  <footer class="bg-gray-800 text-white flex flex-col items-center justify-center p-10 pb-20">
    
    <div class="flex items-center justify-center mb-6">
        <img src="/{{BASE_DIR}}/public/imgs/logo/logoSkuul.png" alt="Logo" class="bg-white rounded-full h-20 w-auto mr-4">
        <div class="text-center text-sm">
            <p class="text-4xl text-blue-500 font-bold">Skuul2Canldy &copy;</p>
            <p class="text-1xl text-gray-300">All Rights Reserved</p>
        </div>
    </div>
    <div class="flex justify-center p-2">
      <ul class="flex flex-row space-x-4 pb-10">
          <li class="hover:text-blue-500"><a href="index.php?page=Useful_Support">Support</a></li>
          <li class="hover:text-blue-500"><a href="index.php?page=Useful_WebPlayer">Web Player</a></li>
          <li class="hover:text-blue-500"><a href="index.php?page=Useful_App">App</a></li>
      </ul>
  </div>
  
   
</footer>


  
  
  
  {{foreach EndScripts}}
  <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor EndScripts}}
  <script>
    import Highway from '@dogstudio/highway/src/highway';
  </script>
  <script type="module">
    // Import the functions you need from the SDKs you need
    import { initializeApp } from "https://www.gstatic.com/firebasejs/10.6.0/firebase-app.js";
    import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.6.0/firebase-analytics.js";
    // TODO: Add SDKs for Firebase products that you want to use
    // https://firebase.google.com/docs/web/setup#available-libraries
  
    // Your web app's Firebase configuration
    // For Firebase JS SDK v7.20.0 and later, measurementId is optional
    const firebaseConfig = {
      apiKey: "AIzaSyATwKVjzXVNNNFdbgrBAzLVTM6eB-FWUkw",
      authDomain: "skulllcandl.firebaseapp.com",
      projectId: "skulllcandl",
      storageBucket: "skulllcandl.appspot.com",
      messagingSenderId: "814076910954",
      appId: "1:814076910954:web:4716cabe516c677353d913",
      measurementId: "G-NGMVYML38B"
    };
  
    // Initialize Firebase
    const app = initializeApp(firebaseConfig);
    const analytics = getAnalytics(app);
  </script>
  <script>
   
    const menuList = document.getElementById('menuList');
    const menuButton = document.getElementById('menuButton');
    
    menuButton.addEventListener('click', () => {
        menuList.classList.toggle('hidden');
    });
  </script>
</body>
</html>
