<section class=" rounded-md p-10" id={{class}}>
    <h2 class="flex flex-wrap justify-center text-white text-6xl text-center mb-4">{{name}}</h2>
    <div class="items-center justify-center">
      <div class="bg-gray-100 rounded-lg shadow-lg p-10 mx-auto lg:flex">
        <div class="p-6">
          <h3 class="text-3xl text-blue-500 font-semibold mb-4 p-4">{{title}}</h3>
          {{foreach text}}
          <p class="text-gray-700 mb-4 px-4">{{description}}</p>
          {{endfor text}}
          {{foreach div}}
          {{code}}
          {{endfor div}}
        </div>
      </div>
    </div>
  </section>