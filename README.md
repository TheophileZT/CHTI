# chti23

**Si vous ouvrez ce fichier README.md avec `Visual Code Studio`, faites CTRL+K,V pour visualiser le contenu.**

Dépôt commun pour le BE chti :
Chaque binome travaille sur ça branche de type grpE_NOM1_NOM2.

## Guide de travail Git
---

Une fois l'[installation](#installation) et la branche faite voilà le *workflow* conseillé en TP chez soi à chaque séance de travail.


 1)  Vérifier que l'on est bien sur sa branche grpX_NOM1_NOM2 (sinon faire git checkout NOMDEBREANCHE) et récuppérer tout ce qu'il y a de nouveau sur le dépôt :   
<code sh>
git status   
git pull
</code>   
Là normalement il n'y a pas de conflit... Sinon il faudra les régler et faire un commit (demander à chatGPT ou au prof)

2) Vous travaillez et modifiez vos fichiers en local. 
3) A la fin d'une séance de travail ou d'une étape il faut enregistrer une version nouvelle de son travail (faire un "commit") et pour cela ajouter les nouveautés à enregistrer (faire des "add"). Un git status permet de voir ou on en est et faire ses add. On peut aveuglément tout ajouter.   
<code shell>
git pull   
git status     
git add * --dry-run 
</code>   
Là vérifier ce que dit le  `dry-run` (essai à vide) et que tout ira bien. N'ajouter que du code source pas de fichiers générés parasites etc.   
<code shell>
git add *   
git commit -am "TP1 pas fini de rien comprendre"   
git push
</code>


## Installation
___

Pour celles qui conaisse git voilà le résumé :

<code bash>
git clone https://git.etud.insa-toulouse.fr/acco/chti23.git
</code>  

Une branche par binôme (pas de fork au cas où on veule faire des modifs de fichier pour toutes)   

<code bash>   
 git checkout -b grpX_Nom1_Nom2   

 touch rapport_be.md & echo "modifiez et complétez ce fichier"
 
 git add rapport_be.md
 
 git commit -am "Mise en place faite"
 
 git push 
</code>   

### Clone
---

* Lancez git bash : "menu windows tapez Git et sélectionnez Git Bash" pour vérifier qu'il est bien installé
* Placez vous où bon vous semble et faites un clic droit puis `Git Bash Here`, puis faite un clone du dépot git (hébergé par l'INSA grâce aux étudiantes du club Info) avec la ligne de commande :   
<code bash>
   git clone https://git.etud.insa-toulouse.fr/acco/chti23.git
</code>

* Pour vérifier, naviguer dans le répertoire `chti23`, faites un clic droit et `Git Bash Here` et tentez de faire la fameuse commande :   
<code bash>
   git status
</code>

> Il se peut qu'un message parlant de **répertoire non secure** s'affiche et propose une ligne de commande  dans le message qui doit resembler à :   
>   git config --global --add safe.directory '%(prefix)///netapp1/GNIAGNIAGNIA...'   
> Faites un copier-coller de cette commande et exécutez-la.
> La commande git status doit enfin fonctionner

### Créez votre branche grpX_NOM1_NOM2
---

Prenons l'exemple du binôme Marie Curie et Maryam Mirzakhani de 3MIC groupe Q. Une fois ressucitées, l'une d'elles se logue sur son compte, clone le dépot et crée sa propre branche locale :

<code bash>
curie@srv-tp$ git checkout -b grpQ_Curie_Mirzakhani

curie@srv-tp$ cd signal/matlab/

curie@srv-tp$ matlab
</code>

Là Marie modifie le code avec chatGPT puis crée une nouvelle version locale : faire un commit.
Supposons que le `scriptDFT.m`
<code bash>
curie@srv-tp$ git status

curie@srv-tp$ git add signal/matlab/scriptDFT.m

curie@srv-tp$ git commit -am "Première modif pour voir"
</code>

A ce moment cette nouvelle version n'existe que dans le .git local de Marie. Si Maryam fait un clone du dépôt de M. Acco elle n'aura pas les nouveautées ni la branche...

<code bash>
maryam@srv-tp$ git clone https://git.etud.insa-toulouse.fr/acco/chti23.git

maryam@srv-tp$ git branch -l
</code>

Ne montre que la branche `master`. Il faut que Marie envoie ses nouveautés sur le dépot d'origin : faire 
un `push`:

<code bash>
curie@srv-tp$ git push
</code>

C'est fait ! Maintenant Maryam peut récupérer les nouveauté du dépôot d'origine en local : faire un  `pull`

<code bash>
maryam@srv-tp$ git pull

maryam@srv-tp$ git checkout grpQ_Curie_Mirzakhani
</code>

Les fichiers sont visibles et partagés !



