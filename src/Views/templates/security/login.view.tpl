<section class="bg-white bg-opacity-20 backdrop-filter backdrop-blur-lg  text-blue-900 min-h-screen flex flex-col md:flex-row md:p-4 md:items-center">
  
  <div class="hidden md:block overflow-hidden relative w-full md:w-1/2 h-1/2 pt-5 pl-5">
    <img src="/{{BASE_DIR}}/public/imgs/security/login.jpeg" alt="Login" id="login_image" class="object-cover w-full h-full rounded-full p-2" />
    <div class="p-2 absolute inset-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-black rounded-full w-8 h-8"></div>
  </div>

  <div class="w-full md:w-1/2 md:pt-10 sm:pt-6 flex items-center justify-center">
    <section class="max-w-lg w-full md:pt-6 sm:pt-6">
     
      <div class="flex mb-8 items-center justify-center">
        <div class="w-48 h-48 md:w-64 md:h-64 rounded-full bg-white p-4 flex flex-col items-center">
          <img src="/{{BASE_DIR}}/public/imgs/logo/logoSkuul.png" alt="Logo" class="w-full h-full object-cover rounded-full border-4 border-gray-300">
          <span class="font-semibold text-3xl md:text-4xl mt-2 hover:text-pink-500 pt-4">Log in</span>
        </div>
      </div>
          
      <form class="grid grid-cols-1 gap-y-6 p-8" method="post" action="index.php?page=sec_login{{if redirto}}&redirto={{redirto}}{{endif redirto}}">
        <div>
          <label for="txtEmail" class="block mb-1">Email</label>
          <input class="w-full text-black px-3 py-2 rounded border focus:outline-none focus:border-blue-500" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}" />
          {{if errorEmail}}
            <div class="text-red-500">{{errorEmail}}</div>
          {{endif errorEmail}}
        </div>
        <div>
          <label for="txtPswd" class="block mb-1">Password</label>
          <input class="w-full text-black px-3 py-2 rounded border focus:outline-none focus:border-blue-500" type="password" id="txtPswd" name="txtPswd" value="{{txtPswd}}" />
          {{if errorPswd}}
            <div class="text-red-500">{{errorPswd}}</div>
          {{endif errorPswd}}
        </div>
        {{if generalError}}
          <div>
            <div class="text-red-500">{{generalError}}</div>
          </div>
        {{endif generalError}}
        <div class="flex justify-end">
          <button class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 focus:outline-none focus:bg-blue-600" id="btnLogin" type="submit">Log me in</button>
        </div>
      </form>
    </section>
  </div>
</section>
<script>
const rotatingImage = document.getElementById('login_image');
function rotateImage() {
  rotatingImage.style.transform = `rotate(${degree}deg)`;
  degree += 0.5;
  requestAnimationFrame(rotateImage);
}
let degree = 0;
rotateImage();
</script>
