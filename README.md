# Fantasy Champs
www.fantasychamps.xyz

<b>Overview:</b><p>
<p>Fantasy Champs is the go to site for getting your fantasy information. It can be the current week results or even the win loss ratio for each individual team for the entire lifetime of the league. There are two levels for Fantasy Champs: free and premium. Free will get you basic statistics where you can see simple things such as the highest score for the season (and lowest) and your win loss ratios. Premium is for the more serious leagues that have multiple games going at once. This will get you a custom league logo made buy us, your own template for your site, more detialed stats. Do you want to know how many times you've played a particular team and your win loss ratio against them? You got it! What about those that have different team names, find out how long a team played in the league and how many name a person has used. 

We used a Trello board to keep on track and to understand who was working on what/when. This keps us organized and was able to make us realize where we were in the project and how it was coming along. 


<b>The Backbones of Fantasy Champs:</b>
<ul><li>Python</li>
<li>HTML</li>
<li>CSS</li>
<li>JavaScript (jQuery)</li>
<li>Flask</li>
<li>Stripe API</li>
<li>NFL Game API</li>
<li>Jinja</li>
<li>Bootstrap</li>
<li>PostgreSQL</li>
<li>Amazon Web Services EC2</li></ul>


<b>MVP (Minimum Viable Product):</b>
<li>User Log in</li>
<li>Mobile Responsive</li>
<li>Payment Option</li>
<li>Pull fantasy stat API's</li>



<b>Stretch Goals:</b>
<li>Chat Board - premium level</li>
<li>Multipe Log in - security levels</li>
<li>Trade History - premium (be able to see who you dropped and when) </li>
<li>Expand to other fantasy leagues (MLB, NHL ect)</li>

<b>Challenges & Solutions:</b>
<p>Early on we knew we needed to pull data from fanstasy sites. Patrick is in a fantasy league on EPSN and Kristine is in a fantasy league on NFL. ESPN has no public way to get the fansty stuff so Patrick had inputed all the data into a database. We found an NFL fantasy API but soon realized that it's not given out it's more for corpoerate. We emailed NFL and got a generic "we will pass this request along" response and as of launch day still haven't recieved the auth information to use it. - So Kristine put in all her NFL stats in manually as well. Our only savior was the find of the Yahoo Fatasy API. This was going to pull a 3rd person's information. However the API is heavily flawed, the documentation on it is not friendly and it hasn't been updated since 2010. This was taken off the board two days in realizing that it was taking too much time and we needed to move on. 


<b>Code Snipits and Screen Shots: </b>