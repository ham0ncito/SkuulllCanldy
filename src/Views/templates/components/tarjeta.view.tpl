<div class="bg-gray-100 mx-12 rounded-lg flex mb-4 items-center justify-center">
    <div class="max-w-md mx-auto bg-white shadow-md rounded-md overflow-hidden">
        <div class="p-4">
            <h2 class="text-xl font-semibold mb-2">We have <span class=" text-2xl text-blue-500">no results</span> to show here</h2>
            
            <div class="flex justify-center">
                <img src="https://1.bp.blogspot.com/-brvdZaWa-Ig/XtrhJSG8EOI/AAAAAAAAAhU/gBorfyDX5ccOk1oP0Gl7WIpzTFtysCGYACLcBGAsYHQ/s640/wbb%2Bsad%2Btvlaint.gif" alt="GIF animado" class=" h-50 w-full">
            </div>
            <p class="text-2xl py-4 text-gray-700 mt-4">We are preparing something <a href="https://www.youtube.com/watch?v=FM7MFYoylVs" class="text-2xl text-blue-500" >special just for you &#155;<a></p>
           
            {{if ~isADMIN}}
            <a href="index.php?page=Admin_Dashboard" class="text-blue-500 my-4">Go back to Dashboard </a>
            {{endif ~isADMIN}}
            {{ifnot ~isADMIN}}
            <a href="index.php?page=Home_Home" class="text-blue-500 my-4">Go back to Home </a>
            {{endifnot ~isADMIN}}
        </div>
    </div>
</div>