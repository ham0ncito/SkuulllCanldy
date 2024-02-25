USE SKULL2CANLDYDB; 

-- Inserta filas en la tabla 'artist' con los siguientes datos:
-- Cada fila representa un artista y contiene su identificador único, nombre, imagen, fecha de nacimiento, país de origen, estado, y biografía.
-- La función SHA2() se utiliza para generar un identificador único a partir del nombre del artista.

INSERT INTO artist (id_artist, name_artist, image_artist, date_of_birth_artist, country_artist, status_artist, artist_bio)
VALUES
    (SHA2("Lady Gaga", 256), 'Lady Gaga', 'https://th.bing.com/th/id/R.b5599c473e77532c6896a112d4a09940?rik=Mer878SPKd1%2fYg&pid=ImgRaw&r=0', '1986-03-28', 'United States', 'ACT', 'Stefani Joanne Angelina Germanotta, known professionally as Lady Gaga, is an American singer, songwriter, and actress.'),
    (SHA2("Ariana Grande", 256), 'Ariana Grande', 'https://th.bing.com/th/id/R.2aa210fdc0031a8fda1bfe99e4c117e1?rik=ZkcKWFW4B%2fADvA&pid=ImgRaw&r=0', '1993-06-26', 'United States', 'ACT', 'Ariana Grande-Butera is an American singer, songwriter, and actress.'),
    (SHA2("Lana Del Rey", 256), 'Lana Del Rey', 'https://th.bing.com/th/id/R.70fe689c73763f389365a6be43d138ae?rik=NaqZObGzGxL7%2bw&pid=ImgRaw&r=0', '1985-06-21', 'United States', 'ACT', 'Elizabeth Woolridge Grant, known professionally as Lana Del Rey, is an American singer-songwriter.'),
    (SHA2("Sam Smith", 256), 'Sam Smith', 'https://th.bing.com/th/id/R.096920ff99e97dc23fd441f0ffb5b61e?rik=HTNFw21lkhRqrQ&pid=ImgRaw&r=0', '1992-05-19', 'United Kingdom', 'ACT', 'Samuel Frederick Smith is an English singer and songwriter.'),
    (SHA2("Adele", 256), 'Adele', 'https://th.bing.com/th/id/R.a5a86f8c0abcc037d15753ef32e25d03?rik=F3Lz6E%2fpKNMFEQ&pid=ImgRaw&r=0', '1988-05-05', 'United Kingdom', 'ACT', 'Adele Laurie Blue Adkins is an English singer-songwriter known for her powerful voice and emotional ballads.'),
    (SHA2("Troye Sivan", 256), 'Troye Sivan', 'https://th.bing.com/th/id/OIP.heuuAY1unJF-8-j5NmpKkgHaJm?rs=1&pid=ImgDetMain', '1995-06-05', 'Australia', 'ACT', 'Troye Sivan Mellet is an Australian singer, songwriter, and actor known for his honest and introspective music.'),
    (SHA2("Harry Styles", 256), 'Harry Styles', 'https://th.bing.com/th/id/R.725ed70ae4201ea010f302fb9939f62a?rik=SUG9QRWtH5CoBg&pid=ImgRaw&r=0', '1994-02-01', 'United Kingdom', 'ACT', 'Harry Edward Styles is a versatile British musician and actor known for his eclectic style and musical creativity.'),
    (SHA2("Blackpink", 256), 'Blackpink', 'https://th.bing.com/th/id/R.345bc678ae372f7f463f60bc2f412702?rik=Wtgs36tQDAkSEg&pid=ImgRaw&r=0', '1996-08-08', 'South Korea', 'ACT', 'Blackpink is a popular South Korean girl group known for their energetic performances and catchy songs.'),
    (SHA2("BTS", 256), 'BTS', 'https://th.bing.com/th/id/R.76068f69a98b2083b2ce0d875ab6a0d4?rik=UmJhZ4R7RANpHQ&pid=ImgRaw&r=0', '1993-12-20', 'South Korea', 'ACT', 'BTS, also known as the Bangtan Boys, is a global phenomenon and South Korean boy band known for their exceptional music and powerful stage presence.'),
    (SHA2("ZAYN", 256), 'ZAYN', 'https://th.bing.com/th/id/R.74ef52def98f69bc4930043c72f18b9b?rik=95XIKQf7Dz7lqA&pid=ImgRaw&r=0', '1993-01-12', 'United Kingdom', 'ACT', 'ZAYN Malik is a British singer-songwriter known for his unique voice and successful solo career.'),
    (SHA2("Katy Perry", 256), 'Katy Perry', 'https://th.bing.com/th/id/R.05c1c72af574110b876c6b580dc4417c?rik=RdlqzeF2JqzXZA&pid=ImgRaw&r=0', '1984-10-25', 'United States', 'ACT', 'Katy Perry, born Katheryn Elizabeth Hudson, is an American singer-songwriter known for her chart-topping hits and vibrant personality.'),
    (SHA2("Taylor Swift", 256), 'Taylor Swift', 'https://th.bing.com/th/id/OIF.vBjS0n0svYP101Hi1yjZ5Q?rs=1&pid=ImgDetMain', '1989-12-13', 'United States', 'ACT', 'Taylor Swift is a Grammy Award-winning American singer-songwriter known for her storytelling through music.'),
    (SHA2("Rihanna", 256), 'Rihanna', 'https://cache.magazine-avantages.fr/data/fichiers/4z/mnr1-rihanna1.jpg', '1988-02-20', 'Barbados', 'ACT', 'Rihanna is a global superstar and Barbadian singer known for her diverse musical style and fashion influence.');
