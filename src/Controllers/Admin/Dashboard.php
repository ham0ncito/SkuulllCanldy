<?php

namespace Controllers\Admin;

use Controllers\PublicController;
class Dashboard extends PublicController{
    public function run():void
    {
        
        $viewData['control'] = [
            [
                'title' => 'Albums',
                'imgUrl' => 'https://th.bing.com/th/id/R.4788de54844027461b94c17be654c1c3?rik=A%2bMXixtecmLdtA&riu=http%3a%2f%2fhiphop-n-more.com%2fwp-content%2fuploads%2f2013%2f06%2fyeezus-new-cover.jpg&ehk=8wXzlaWGoVLeCzFh3Be6bzZ%2fE4Sjxo5EB3VmtxrzRhU%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Albums_Album',
            ],
            [
                'title' => 'Artist',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Artists_Artist',
            ], [
                'title' => 'Bitacora',
                'imgUrl' => 'https://th.bing.com/th/id/R.937c02994f2cd5466a8a905af24d98d5?rik=Tpei6kM4yJYhZw&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Bitacoras_Bitacora',
            ],
            [
                'title' => 'Caretilla',
                'imgUrl' => 'https://th.bing.com/th/id/R.ccebc27ad930a411857a1d866a967d4c?rik=48ujj18Z3BZaFA&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Carretillas_Carretilla',
            ],
            [
                'title' => 'Caretilla Anon',
                'imgUrl' => 'https://th.bing.com/th/id/OIP.Ag3L6xTZW6rxy10XpD1eAwHaHP?rs=1&pid=ImgDetMain',
                'url'=> 'index.php?page=Carretillaanons_Carretillaanon'
            ],
            [
                'title' => 'Favorites',
                'imgUrl' => 'https://th.bing.com/th/id/R.4b9b7d2001285d1db52137eb9766e557?rik=uYK69uZwy8poHg&riu=http%3a%2f%2fwww.clipartbest.com%2fcliparts%2fLcK%2fzMo%2fLcKzMoBLi.png&ehk=P7i5vXvaAT%2bLbmGWhYkkqr1PyqVYM9atXOhaD7Nmd7w%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Favoritess_Favorites',
            ],
            [
                'title' => 'Albums',
                'imgUrl' => 'https://th.bing.com/th/id/R.4788de54844027461b94c17be654c1c3?rik=A%2bMXixtecmLdtA&riu=http%3a%2f%2fhiphop-n-more.com%2fwp-content%2fuploads%2f2013%2f06%2fyeezus-new-cover.jpg&ehk=8wXzlaWGoVLeCzFh3Be6bzZ%2fE4Sjxo5EB3VmtxrzRhU%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Albums_Album',
            ],
            [
                'title' => 'Artist',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Artist_Artist',
            ],
            [
                'title' => 'Albums',
                'imgUrl' => 'https://th.bing.com/th/id/R.4788de54844027461b94c17be654c1c3?rik=A%2bMXixtecmLdtA&riu=http%3a%2f%2fhiphop-n-more.com%2fwp-content%2fuploads%2f2013%2f06%2fyeezus-new-cover.jpg&ehk=8wXzlaWGoVLeCzFh3Be6bzZ%2fE4Sjxo5EB3VmtxrzRhU%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Albums_Album',
            ],
            [
                'title' => 'Artist',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Artist_Artist',
            ],
            [
                'title' => 'Albums',
                'imgUrl' => 'https://th.bing.com/th/id/R.4788de54844027461b94c17be654c1c3?rik=A%2bMXixtecmLdtA&riu=http%3a%2f%2fhiphop-n-more.com%2fwp-content%2fuploads%2f2013%2f06%2fyeezus-new-cover.jpg&ehk=8wXzlaWGoVLeCzFh3Be6bzZ%2fE4Sjxo5EB3VmtxrzRhU%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Albums_Album',
            ],
            [
                'title' => 'Artist',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Artist_Artist',
            ],
            [
                'title' => 'Albums',
                'imgUrl' => 'https://th.bing.com/th/id/R.4788de54844027461b94c17be654c1c3?rik=A%2bMXixtecmLdtA&riu=http%3a%2f%2fhiphop-n-more.com%2fwp-content%2fuploads%2f2013%2f06%2fyeezus-new-cover.jpg&ehk=8wXzlaWGoVLeCzFh3Be6bzZ%2fE4Sjxo5EB3VmtxrzRhU%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Albums_Album',
            ],
            [
                'title' => 'Artist',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Artist_Artist',
            ],
            [
                'title' => 'Albums',
                'imgUrl' => 'https://th.bing.com/th/id/R.4788de54844027461b94c17be654c1c3?rik=A%2bMXixtecmLdtA&riu=http%3a%2f%2fhiphop-n-more.com%2fwp-content%2fuploads%2f2013%2f06%2fyeezus-new-cover.jpg&ehk=8wXzlaWGoVLeCzFh3Be6bzZ%2fE4Sjxo5EB3VmtxrzRhU%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Albums_Album',
            ],
            [
                'title' => 'Artist',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Artist_Artist',
            ],
            [
                'title' => 'Albums',
                'imgUrl' => 'https://th.bing.com/th/id/R.4788de54844027461b94c17be654c1c3?rik=A%2bMXixtecmLdtA&riu=http%3a%2f%2fhiphop-n-more.com%2fwp-content%2fuploads%2f2013%2f06%2fyeezus-new-cover.jpg&ehk=8wXzlaWGoVLeCzFh3Be6bzZ%2fE4Sjxo5EB3VmtxrzRhU%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Albums_Album',
            ],
            [
                'title' => 'Artist',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Artist_Artist',
            ],];
        \Views\Renderer::render("admin/dashboard", $viewData);
    }
}

?>