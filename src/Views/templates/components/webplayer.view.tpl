<div class="flex min-h-screen rounded-lg shadow-lg items-center justify-center " style="animation: discoBackground 6s ease-in-out infinite;" >
    <div class="w-2/3">
      <div class="bg-white border-slate-100 dark:bg-slate-800 dark:border-slate-500 border-b rounded-t-xl p-4 pb-6 sm:p-10 sm:pb-8 lg:p-6 xl:p-10 xl:pb-8 space-y-6 sm:space-y-8 lg:space-y-6 xl:space-y-8  items-center" >
        
            <div class="flex items-center space-x-4">
               <video id="rickrol" src="https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Videos%2Fy2mate.com%20-%20Rick%20Astley%20%20Never%20Gonna%20Give%20You%20Up%20Official%20Music%20Video_1080p.mp4?alt=media&token=7e5931ce-f7bf-4f90-83aa-be0f3581909b" class="w-full h-full object-cover" autoplay controls></video>
                </div>
            </div>
           
       
    </div>
</div>
<script>
    window.onload = function() {
      var video = document.getElementById('rickrol');
      video.play();
    };
  </script>
<style>
    @keyframes discoBackground {
        0% {
          background-color: #3498db; 
        }
        50% {
          background-color: #9b59b6; 
        }
        100% {
          background-color: #3498db;
        }
      }
</style>