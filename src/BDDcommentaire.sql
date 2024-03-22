Base de donnée pour les commentaires.

il me faut : une reference à la soupe, donc ID_soup

la reference à la personne qui pose le commentaire. ID_USER

un titre ?  title
  
un texte !! comment_text

une date date format dd/mm/yy  00:00


CREATE TABLE commentaire (
id int PRIMARY KEY auto_increment NOT NULL,
id_soup INT, FOREIGN KEY (id_soup) REFERENCES soup(id),
id_user INT(10) NOT NULL,
text_comment TEXT NOT NULL, 
date_comment datetime NOT NULL
) 
