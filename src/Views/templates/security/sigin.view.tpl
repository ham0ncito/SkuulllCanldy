<section class="bg-white bg-opacity-20 backdrop-filter rounded-lg backdrop-blur-lg text-white min-h-screen md:flex flex-col md:flex-row-reverse items-center">

  <div class="w-full md:w-1/2 p-8 flex flex-col items-center justify-center md:justify-start">
    <div class="w-48 h-48 md:w-64 md:h-64 rounded-full bg-white p-4 flex flex-col items-center">
      <img src="/{{BASE_DIR}}/public/imgs/logo/logoSkuul.png" alt="Logo" class="w-full h-full object-cover rounded-full border-4 border-gray-300">
    </div>

    <form class="max-w-md mx-auto rounded px-8 pt-6 pb-8 mb-4" action="index.php?page=Sec_Register" method="POST">
      <h1 class="text-4xl text-blue-500 text-center md:text-left mb-4 p-4">Create your account</h1>
      <div class="mb-4">
        <label class="block text-white text-sm font-bold mb-2" for="txtEmail">Email</label>
        <input class="w-full text-black rounded border px-3 py-2 focus:outline-none focus:border-blue-500" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}" />
        {{if errorEmail}}
          <div class="text-red-500">{{errorEmail}}</div>
        {{endif errorEmail}}
      </div>
      <div class="mb-6">
        <label class="block text-white text-sm font-bold mb-2" for="txtPswd">Password</label>
        <input class="w-full text-black rounded border px-3 py-2 focus:outline-none focus:border-blue-500" type="password" id="txtPswd" name="txtPswd" value="{{txtPswd}}" />
        {{if errorPswd}}
          <div class="text-red-500">{{errorPswd}}</div>
        {{endif errorPswd}}
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
