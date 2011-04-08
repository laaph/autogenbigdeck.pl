autogenbigdeck.pl
=================

This is a program to generate random decks for a variant of magic me and my 
friends play.   The decks it creates are not very good, but I am more
interested in drawing an interesting card than winning the game.

The variant
===========

We call these decks "big decks", and since then there have been similar deck
formats used in the greater MtG world as well as in tournaments.  The deck
building procedure is 

* 20 cards of each color, with multicolored being considered another color
* 20 artifacts
* other than basic land, no more than one of any given card
* no ante cards, no unglued/unhinged cards
* since we usually play online, cards that are difficult to play online
  are discouraged
* other than that, there have been no banned cards

However, in our group there certainly have been discouraged cards, including
any card that says "control another player's turn'.

How To Use
==========

This program requires perl, although the autogenbigdeck.exe is a windows 
executable that was generated using Strawberry Perl.  Put the input decks
(artifacts.mwDeck, black.mwDeck, blue.mwDeck, gold.mwDeck, green.mwDeck,
lands.mwDeck, red.mwDeck, white.mwDeck) in the same folder as autogenbigdeck.pl
and run the program!  A deck will be generated with a name based on the time
of your system clock.  You may edit the input decks to suit your tastes.

Bugs
====

Oddly enough, this program can't count and it is not always guaranteed that
there will be 20 of each color.

Algorithm
=========

This program starts out supplying 8 of each basic land, one of each crossland,
and 60 other random land cards.  Then, given a list of cards, all the program 
does is pick 20 at random.  So start out with a good set of cards!  The next 
version will attempt to do some mana balancing, so you can put more cards of 
higher mana casting costs without fearing that the deck will be unplayable due
to expensive cards.
