<div x-data="{ isPlaying: false }" class="flex min-h-screen rounded-lg shadow-lg items-center justify-center " style="animation: discoBackground 6s ease-in-out infinite;" >
    <div class="w-2/3">
      <div class="bg-white border-slate-100 dark:bg-slate-800 dark:border-slate-500 border-b rounded-t-xl p-4 pb-6 sm:p-10 sm:pb-8 lg:p-6 xl:p-10 xl:pb-8 space-y-6 sm:space-y-8 lg:space-y-6 xl:space-y-8  items-center" >
        
            <div class="flex items-center space-x-4">
                <img src="https://img.freepik.com/free-psd/square-flyer-template-maximalist-business_23-2148524497.jpg?w=1800&t=st=1699458420~exp=1699459020~hmac=5b00d72d6983d04966cc08ccd0fc1f80ad0d7ba75ec20316660e11efd18133cd"
                    alt="" width="88" height="88" class="flex-none rounded-lg bg-gray-100" loading="lazy" />
                <div class="min-w-0 flex-auto space-y-1 font-semibold">
                    <p class="text-gray-500 dark:text-cyan-400 text-sm leading-6">
                        <abbr title="Track">Track:</abbr> 05
                    </p>
                    <h2 class="text-blue-500 dark:text-slate-400 text-sm leading-6 truncate">
                        Music: New Album The Lorem
                    </h2>
                    <p class="text-pink-500 dark:text-slate-50 text-lg">
                        Spotisimo
                    </p>
                </div>
            </div>
            <div class="space-y-2">
                <div class="relative">
                    <div class="bg-rose-200 dark:bg-rose-700 rounded-full overflow-hidden">
                        <div class="bg-rose-500 dark:bg-rose-400 w-1/2 h-2" role="progressbar"
                            aria-label="music progress" aria-valuenow="1456" aria-valuemin="0"
                            aria-valuemax="4550"></div>
                    </div>
                    <div
                        class="ring-rose-500 dark:ring-rose-400 ring-2 absolute left-1/2 top-1/2 w-4 h-4 -mt-2 -ml-2 flex items-center justify-center bg-white rounded-full shadow">
                        <div
                            class="w-1.5 h-1.5 bg-rose-500 dark:bg-rose-400 rounded-full ring-1 ring-inset ring-gray-900/5">
                        </div>
                    </div>
                </div>
                <div class="flex justify-between text-sm leading-6 font-medium tabular-nums">
                    <div class="text-rose-500 dark:text-rose-400">1:75</div>
                    <div class="text-rose-600 dark:text-rose-500">3:20</div>
                </div>
            </div>
        </div>            
        <div class="bg-gray-900 text-gray-200 rounded-b-xl flex flex-wrap items-center justify-evenly">
            <button type="button" @click="isPlaying = !isPlaying"
                class="bg-green-500 text-white dark:bg-blue-500 dark:text-white flex-none -my-2 mx-auto w-20 h-20 rounded-full ring-1 ring-gray-900/5 shadow-md flex items-center justify-center"
                aria-label="Play/Pause">
                <svg x-show="!isPlaying" width="30" height="32" fill="currentColor">
                    <rect x="6" y="4" width="4" height="24" rx="2" />
                    <rect x="20" y="4" width="4" height="24" rx="2" />
                </svg>
                <svg x-show="isPlaying" width="30" height="32" fill="currentColor">
                    <rect x="10" y="4" width="4" height="24" rx="2" />
                    <rect x="14" y="4" width="4" height="24" rx="2" />
                </svg>
            </button>
            <button type="button" aria-label="Skip 10 seconds">
                <svg width="24" height="24" fill="none">
                    <path d="M17.509 16.95c-2.862 2.733-7.501 2.733-10.363 0-2.861-2.734-2.861-7.166 0-9.9 2.862-2.733 7.501-2.733 10.363 0 .38.365.711.759.991 1.176" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                    <path d="M19 5v3.111c0 .491-.398.889-.889.889H15" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                </svg>
            </button>
            <button type="button" aria-label="Next">
                <svg width="24" height="24" fill="none">
                    <path d="M14 12 6 6v12l8-6Z" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                    <path d="M18 6v12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                </svg>
            </button>
            <button type="button" class="rounded-lg text-xs leading-6 font-semibold px-2 ring-2 ring-inset ring-gray-700 dark:text-gray-100 dark:ring-0 dark:bg-gray-500">
                1x
            </button>
        </div>
    </div>
</div>

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