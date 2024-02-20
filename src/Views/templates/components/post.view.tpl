<div class="max-w-xl mx-auto bg-white rounded-lg shadow-lg overflow-hidden">
  <div class="bg-gradient-to-r from-purple-900 to-purple-600 p-4">
    <h2 class="text-2xl lg:text-3xl font-bold text-white mb-2">{{name}}</h2>
    <p class="text-gray-200 text-sm">{{date}}</p>
  </div>
  <div class="p-4">
    <h3 class="text-xl lg:text-2xl font-semibold text-blue-600 mb-4">{{title}}</h3>
    {{foreach text}}
    <p class="text-gray-800 mb-4">{{description}}</p>
    {{endfor text}}
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
      {{foreach div}}
      <div>
        {{code}}
      </div>
      {{endfor div}}
    </div>
  </div>
</div>
