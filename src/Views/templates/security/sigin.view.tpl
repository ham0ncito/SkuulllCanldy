<section class="text-white min-h-screen md:flex flex-col md:flex-row-reverse items-center">

  <div class="w-full md:w-1/2 p-8 flex flex-col items-center justify-center md:justify-start">
    <form class="max-w-md mx-auto rounded px-8 pt-6 pb-8 mb-4" action="index.php?page=Sec_Register" method="POST">
      <h1 class="text-4xl text-white text-center md:text-left mb-4 p-4">Create your account</h1>
      <div class="mb-4 relative">
        <label class="block text-white text-sm font-bold mb-2" for="txtEmail">Email</label>
        <input class="w-full text-black rounded border px-3 py-2 focus:outline-none focus:border-blue-500" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}" />
        {{if errorEmail}}
          <div class="text-red-500">{{errorEmail}}</div>
        {{endif errorEmail}}
        <div x-data="{ showTooltipEmail: false }" @mouseenter="showTooltipEmail = true" @mouseleave="showTooltipEmail = false" class="absolute top-0 right-0 mt-1 mr-1">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white cursor-pointer" viewBox="0 0 20 20">
            <path fill="currentColor" d="M10 18a8 8 0 100-16 8 8 0 000 16zm0-2a6 6 0 110-12 6 6 0 010 12zM10 9a1 1 0 011 1v1a1 1 0 11-2 0V9a1 1 0 011-1zm1-3.5a1 1 0 01-2 0 1 1 0 012 0z"/>
          </svg>
          <div x-show="showTooltipEmail" class="absolute z-10 bg-gray-800 text-white text-xs rounded px-2 py-1 bottom-full left-1/2 transform -translate-x-1/2 -translate-y-2 opacity-75">
            Provive a valid email address that you have access to
          </div>
        </div>
      </div>
      <div class="mb-6 relative">
        <label class="block text-white text-sm font-bold mb-2" for="txtPswd">Password</label>
        <input class="w-full text-black rounded border px-3 py-2 focus:outline-none focus:border-blue-500" type="password" id="txtPswd" name="txtPswd" value="{{txtPswd}}" />
        {{if errorPswd}}
          <div class="text-red-500">{{errorPswd}}</div>
        {{endif errorPswd}}
        <div x-data="{ showTooltipPswd: false }" @mouseenter="showTooltipPswd = true" @mouseleave="showTooltipPswd = false" class="absolute top-0 right-0 mt-1 mr-1">
          <svg xmlns="http://www.w3.org/2000/svg" class=" h-6 w-6 text-white cursor-pointer" viewBox="0 0 20 20">
            <path fill="currentColor" d="M10 18a8 8 0 100-16 8 8 0 000 16zm0-2a6 6 0 110-12 6 6 0 010 12zM10 9a1 1 0 011 1v1a1 1 0 11-2 0V9a1 1 0 011-1zm1-3.5a1 1 0 01-2 0 1 1 0 012 0z"/>
          </svg>
          <div x-show="showTooltipPswd" class="absolute z-10 bg-gray-800 text-white text-xs rounded px-2 py-1 bottom-full left-1/2 transform -translate-x-1/2 -translate-y-2 opacity-75">
            Provide a secure passphrase using at least 8 characters and including special characters such as $ # 
          </div>
        </div>
      </div>
      <div class="flex items-center justify-end">
        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:bg-blue-700" id="btnSignin" type="submit">Create Account</button>
      </div>
    </form>
  </div>

  <div class="w-full md:w-1/2 p-6 flex flex-col items-center justify-center md:justify-start">
    <div class="splide border border-gray-300 rounded-md p-4">
      <div class="splide__track">
        <ul class="splide__list">
          <li class="splide__slide"><img src="/{{BASE_DIR}}/public/imgs/advertisment/ad.jpeg" alt="Slide 1"></li>
          <li class="splide__slide"><img src="/{{BASE_DIR}}/public/imgs/advertisment/ad2.jpeg" alt="Slide 2"></li>
          <li class="splide__slide"><img src="/{{BASE_DIR}}/public/imgs/advertisment/ad3.jpeg" alt="Slide 3"></li>
          <li class="splide__slide"><img src="/{{BASE_DIR}}/public/imgs/advertisment/ad4.jpeg" alt="Slide 4"></li>
          <li class="splide__slide"><img src="/{{BASE_DIR}}/public/imgs/advertisment/ad5.jpeg" alt="Slide 5"></li>
          <li class="splide__slide"><img src="/{{BASE_DIR}}/public/imgs/advertisment/ad6.jpeg" alt="Slide 6"></li>
          <li class="splide__slide"><img src="/{{BASE_DIR}}/public/imgs/advertisment/ad7.jpeg" alt="Slide 7"></li>
          <li class="splide__slide"><img src="/{{BASE_DIR}}/public/imgs/advertisment/ad8.jpeg" alt="Slide 8"></li>
        </ul>
      </div>
    </div>
  </div>

</section>


<script src="/{{BASE_DIR}}/node_modules/@splidejs/splide/dist/js/splide.min.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    new Splide('.splide', {
      type: 'carousel',
      perPage: 1,
      autoplay: true,
       autoplaySpeed: 1000,
       rewind: true
    }).mount();
  });
</script>
