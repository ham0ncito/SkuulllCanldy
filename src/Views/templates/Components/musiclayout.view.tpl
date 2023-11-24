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
  <script src="anime.min.js"></script>
  {{foreach SiteLinks}}
    <link rel="stylesheet" href="/{{~BASE_DIR}}/{{this}}" />
  {{endfor SiteLinks}}
  {{foreach BeginScripts}}
    <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor BeginScripts}}
</head>
<body class="bg-black-100 h-screen">
  <header class="bg-gray-900 text-white w-full">
    <div class="container mx-auto flex items-center justify-between py-4">
      <div class="flex items-center">
       
        <div class="w-12 h-12 md:w-16 md:h-16 bg-gray-200 rounded-full">
          <a href="index.php?page=Index"> <img src="/{{BASE_DIR}}/public/imgs/logo/logoSkuul.png" alt="Logo" class="w-full h-full object-cover" /></a>
         
        </div>
        <h2 class="text-xl font-bold mr-4 pl-4">Skul2Canldy</h2>
      </div>
      <nav class="flex items-center space-x-4">
        <button class="md:hidden focus:outline-none" onclick="toggleMenu()">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path>
          </svg>
        </button>
        <ul id="mobileMenu" class="hidden md:flex items-center space-x-6">
          <li><a href="index.php?page={{PUBLIC_DEFAULT_CONTROLLER}}" class="text-white hover:text-pink-500">Home</a></li>
          {{foreach PUBLIC_NAVIGATION}}
            <li><a href="{{nav_url}}" class="text-white hover:text-pink-500">{{nav_label}}</a></li>
          {{endfor PUBLIC_NAVIGATION}}
        </ul>
      </nav>
    </div>
  </header>
  <main class="bg-gray-700 flex-grow">
    <div class="container mx-auto py-10">
      
          {{{page_content}}}
    
    </div>
  </main>  

  <footer class="bg-gray-900 text-white py-14">
    <div class="container mx-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
      <div>
        <div class="flex mb-8 items-center justify-center">
          <div class="w-12 h-12 md:w-16 md:h-16 bg-gray-200 rounded-full">
            <img src="/{{BASE_DIR}}/public/imgs/logo/logoSkuul.png" alt="Logo" class="w-full h-full object-cover" />
          </div>
          <span class="font-semibold align-center justify-center text-4xl hover:text-pink-500 pl-4 hover:text-6xl">Skul2Canldy</span>
        </div>
        <span class="font-semibold align-center justify-center text-4xl hover:text-pink-500 pl-4 hover:text-6xl">Skul2Canldy</span>
      </div>
    </div>
  </footer>
  
  </footer>
  
  
  {{foreach EndScripts}}
    <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor EndScripts}}
  <script>
    function toggleMenu() {
      var mobileMenu = document.getElementById("mobileMenu");
      if (mobileMenu.classList.contains("hidden")) {
        mobileMenu.classList.remove("hidden");
      } else {
        mobileMenu.classList.add("hidden");
      }
    }
  </script>
  
</body>
</html>
