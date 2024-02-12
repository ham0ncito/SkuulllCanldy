<section class="text-blue-900 min-h-screen flex flex-col md:flex-row md:p-4 md:items-center">

  <div class="hidden md:block w-full md:w-1/2 h-1/2 pt-5 pl-5 relative overflow-hidden">
    <img src="/{{BASE_DIR}}/public/imgs/security/login.jpeg" alt="Login" id="login_image" class="object-cover w-full h-full rounded-full p-2 rotating-image" />
    <div class="absolute inset-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-black rounded-full w-8 h-8"></div>
  </div>

  <div class="w-full md:w-1/2 md:pt-10 sm:pt-6 p-8 flex mb-10 items-center justify-center">
    <section class="max-w-lg w-full md:pt-6 sm:pt-6">

      <div class="flex mb-8 items-center justify-center">
        <div class="w-48 h-48 md:w-64 md:h-64 rounded-full bg-white p-4 flex flex-col items-center relative">
          <img src="/{{BASE_DIR}}/public/imgs/logo/logoSkuul.png" alt="Logo" class="w-full object-cover rounded-full border-4 border-gray-300">
          
          <h2 class="font-semibold text-white text-center p-4 text-3xl md:text-4xl mt-2">Welcome to Skuul2Canldy</h2>
          
         
          <div x-data="{ showTooltip: false }" @mouseenter="showTooltip = true" @mouseleave="showTooltip = false" class="absolute top-0 right-0 mt-1 mr-1">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-blue-500 cursor-pointer" viewBox="0 0 20 20">
              <path fill="currentColor" d="M10 18a8 8 0 100-16 8 8 0 000 16zm0-2a6 6 0 110-12 6 6 0 010 12zM10 9a1 1 0 011 1v1a1 1 0 11-2 0V9a1 1 0 011-1zm1-3.5a1 1 0 01-2 0 1 1 0 012 0z"/>
            </svg>
           
            <div x-show="showTooltip" class="absolute z-10 bg-gray-800 text-white text-xs rounded px-2 py-1 bottom-full left-1/2 transform -translate-x-1/2 -translate-y-2 opacity-75">
              To access enter your login credentials, the same as the ones you registered with.
            </div>
          </div>
          
        </div>
      </div>

      <form class="mt-12 grid grid-cols-1 pt-10 gap-y-6 p-8 " method="post" action="index.php?page=sec_login{{if redirto}}&redirto={{redirto}}{{endif redirto}}">
        <input type="hidden" name="xss_login" value="{{~xss_login}}"/>

        <div>
          <label for="txtEmail" class="block mb-1">Email</label>
          <input class="w-full text-black px-3 py-2 rounded border focus:outline-none focus:border-blue-500" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}" />
          {{if errorEmail}}
          <div class="text-red-500 mt-1">{{errorEmail}}</div>
          {{endif errorEmail}}
        </div>

        <div>
          <label for="txtPswd" class="block mb-1">Password</label>
          <input class="w-full text-black px-3 py-2 rounded border focus:outline-none focus:border-blue-500" type="password" id="txtPswd" name="txtPswd" value="{{txtPswd}}" />
          {{if errorPswd}}
          <div class="text-red-500 mt-1">{{errorPswd}}</div>
          {{endif errorPswd}}
        </div>

        {{if generalError}}
        <div class="text-red-500 mt-1">{{generalError}}</div>
        {{endif generalError}}

        <div class="flex justify-end">
          <button class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 focus:outline-none focus:bg-blue-600" id="btnLogin" type="submit">Log me in</button>
        </div>
      </form>

    </section>
  </div>
</section>




<style>
  .rotating-image {
    animation: rotateImage 5s linear infinite;
  }
  
  @keyframes rotateImage {
    from {
      transform: rotate(0deg);
    }
    to {
      transform: rotate(360deg);
    }
  }
  </style>