-- Ejemplo de inserciones con identificadores generados mediante UUID en MySQL
USE skull2canldydb; 
-- Inserta filas en la tabla 'genre' con los siguientes datos:
-- Cada fila representa un género musical e incluye su identificador único, nombre, descripción, estado y enlace a una imagen representativa.
-- La función SHA2() se utiliza para generar un identificador único a partir del nombre del género.

INSERT INTO genre (id_genre, name_genre, description_genre, status_genre, image_genre)
VALUES
(SHA2("Rock", 256), 'Rock', 'Music genre focusing on guitars and drums', 'ACT', 'https://th.bing.com/th/id/R.e130a0cfac46c80d9b930a412aae4790?rik=5BlVN3w0%2bUrNtQ&pid=ImgRaw&r=0'),
(SHA2("Pop", 256), 'Pop', 'Popular music genre with catchy melodies', 'ACT', 'https://i.pinimg.com/originals/8b/08/1a/8b081a52e157562bf4be31403caadbfb.jpg'),
(SHA2("Hip Hop", 256), 'Hip Hop', 'Urban music genre with rap and beats', 'ACT', 'https://th.bing.com/th/id/OIP.AEkjMBLqs3ukPUZi_KL_swHaE6?rs=1&pid=ImgDetMain'),
(SHA2("Electronic", 256), 'Electronic', 'Music genre using electronic instruments', 'ACT', 'https://th.bing.com/th/id/R.45cb0a3b583e8d342157611383cabee9?rik=6hqkpiqn4oX3vg&pid=ImgRaw&r=0'),
(SHA2("Jazz", 256), 'Jazz', 'Genre known for improvisation and swing rhythms', 'ACT', 'https://th.bing.com/th/id/OIP.OcBZMYVUYlAdMX1xdg2dtgAAAA?rs=1&pid=ImgDetMain'),
(SHA2("Classical", 256), 'Classical', 'Music genre with symphonic compositions', 'ACT', 'https://th.bing.com/th/id/R.97ce002e17b57d93a83cf246b8154a5e?rik=%2f3a9In0fGq%2fsxg&pid=ImgRaw&r=0'),
(SHA2("Reggae", 256), 'Reggae', 'Music genre with origins in Jamaica', 'ACT', 'https://th.bing.com/th/id/R.fe5af5e43743fec45c5e41af78496b3f?rik=aVahkeZ6Utj1Mw&riu=http%3a%2f%2fcalcioclown.files.wordpress.com%2f2011%2f03%2fmarihuana.jpeg&ehk=DMoypxXOErjvltSiQPkydpF6L9NyfH3202rrihlDIIM%3d&risl=&pid=ImgRaw&r=0'),
(SHA2("Country", 256), 'Country', 'Music genre from rural America','ACT', 'https://th.bing.com/th/id/R.e7440087cc9ab4c2c87b4b0ef547ec45?rik=R7R2z4z3i8s48g&riu=http%3a%2f%2fcdn.shopify.com%2fs%2ffiles%2f1%2f1062%2f1008%2ffiles%2f2_b40347b9-694c-4680-a7a3-7d58aee9dd8e.jpg%3f12000381829879533878&ehk=diItY%2bb4oMs4pSbi9CsPMjYqf1I2HPpCsNz2DI241bo%3d&risl=&pid=ImgRaw&r=0'),
(SHA2("Blues", 256), 'Blues', 'Genre rooted in African American history', 'ACT', 'https://th.bing.com/th/id/OIP.sV7oBSuCWo56BHAJzuNTHAHaE5?rs=1&pid=ImgDetMain'),
(SHA2("Funk", 256), 'Funk', 'Genre with strong rhythmic groove','ACT', 'https://th.bing.com/th/id/R.e74b1a815aa80010384e6139b6c73f82?rik=ZJ4RWtdlqR3IXQ&riu=http%3a%2f%2fliveforlivemusic.com%2fwp-content%2fuploads%2f2016%2f12%2fGeorgeClinton-BootsyCollins.jpg&ehk=0Qg3t1C9REwU0ARydcXpUf1R8Yo%2bNQHlungbz%2f8fcXM%3d&risl=&pid=ImgRaw&r=0');
