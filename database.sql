create table "albums" (
	"album_id" serial primary key,
	"album_name" varchar(64) not null,
	"release_year" int not null);

create table "songs" (
	"song_id" serial primary key,
	"song_name" varchar(64) not null,
	"album_id" int not null,
	"song_lyrics" text not null,
);

create table "lyrics_fragments" (
	"fragment_id" serial primary key,
	"fragment_text" text not null,
	"song_id" int not null
);

create table "context_data" (
	"context_id" serial primary key,
	"location_ref" varchar(64) default 'null',
	"music_lit_ref" varchar(64) default 'null',
	"theme" varchar(64) default null,
	"chords" varchar(64) default null,
	"song_id" int default null,
	"fragment_id" default null
);

alter table "context_data" alter column "theme" drop not null;
alter table "context_data" alter column "chords" drop not null;
alter table "context_data" alter column "song_id" drop not null;
alter table "context_data" alter column "fragment_id" drop not null;

create table "users" (
	"user_id" serial primary key,
	"username" varchar(64) not null,
	"salted hash" varchar(64) not null unique
);

create table "user_creations" (
	"content_id" serial primary key,
	"content_name" varchar(64) not null,
	"content_text" text not null,
	"user_id" int not null
);

create table "saved_fragments" (
	"fragment_id" serial primary key,
	"user_id" int not null
);

alter table "songs" add constraint "songs_fk0" foreign key ("album_id") references "albums"("album_id");

alter table "lyrics_fragments" add constraint "lyrics_fragments_fk0" foreign key ("song_id") references "songs"("song_id");

alter table "context_data" add constraint "context_data_fk0" foreign key ("song_id") references "songs"("song_id");
alter table "context_data" add constraint "context_data_fk1" foreign key ("fragment_id") references "lyrics_fragments"("fragment_id");


alter table "user_creations" add constraint "user creations_fk0" foreign key ("user_id") references "users"("user_id");

alter table "saved_fragments" add constraint "saved fragments_fk0" foreign key ("fragment_id") references "lyrics_fragments"("fragment_id");
alter table "saved_fragments" add constraint "saved_fragments_fk1" foreign key ("user_id") references "users"("user_id");

select * from albums;
select * from songs;

select * from albums join songs on albums.album_id = songs.album_id;

select * from albums join songs on albums.album_id = songs.album_id join lyrics_fragments on songs.song_id = lyrics_fragments.song_id;

select * from albums join songs on albums.album_id = songs.album_id join lyrics_fragments on songs.song_id = lyrics_fragments.song_id;
join context_data on lyrics_fragments.fragment_id = context_data.fragment_id;

select * from users join user_creations on users.user_id = user_creations.user_id join saved_fragments on users.user_id = saved_fragments.user_id;

insert into "albums" ("album_name", "release_year") values ('Born to Run', 1975);
insert into "albums" ("album_name", "release_year") values ('The River', 1980);
insert into "albums" ("album_name", "release_year") values ('Nebraska', 1982);
insert into "albums" ("album_name", "release_year") values ('Born in the USA', 1984);
insert into "albums" ("album_name", "release_year") values ('Greetings from Asbury Park, NJ', 1973);
insert into "albums" ("album_name", "release_year") values ('The Wild, the Innocent, & the E Street Shuffle', 1973);
insert into "albums" ("album_name", "release_year") values ('Darkness at thte Edge of Town', 1978);

alter table "lyrics_fragments" add column song_id int;

insert into "songs" ("song_name", "album_id", "song_lyrics") values ('Born in the USA', 7, 'Born down in a dead man''s town
The first kick I took was when I hit the ground
You end up like a dog that''s been beat too much
Till you spend half your life just covering up

Born in the USA, I was born in the USA
I was born in the USA, born in the USA

Got in a little hometown jam
So they put a rifle in my hand
Sent me off to a foreign land
To go and kill the yellow man

Born in the USA...

Come back home to the refinery
Hiring man said "Son if it was up to me"
Went down to see my V.A. man
He said "Son, don''t you understand"

I had a brother at Khe Sahn
Fighting off the Viet Cong
They''re still there, he''s all gone
He had a woman he loved in Saigon
I got a picture of him in her arms now

Down in the shadow of the penitentiary
Out by the gas fires of the refinery
I''m ten years burning down the road
Nowhere to run ain''t got nowhere to go

Born in the USA, I was born in the USA
Born in the USA, I''m a long gone Daddy in the USA
Born in the USA, Born in the USA
Born in the USA, I''m a cool rocking Daddy in the USA'),




('Cover Me', 7, 'The times are tough now, just getting tougher
This old world is rough, it''s just getting rougher
Cover me, come on baby, cover me
Well I''m looking for a lover who will come on in and cover me
Promise me baby you won''t let them find us
Hold me in your arms, let''s let our love blind us
Cover me, shut the door and cover me
Well I''m looking for a lover who will come on in and cover me

Outside''s the rain, the driving snow
I can hear the wild wind blowing
Turn out the light, bolt the door
I ain''t going out there no more

This whole world is out there just trying to score
I''ve seen enough I don''t want to see any more,
Cover me, come on and cover me
I''m looking for a lover who will come on in and cover me
Looking for a lover who will come on in and cover me'),




('Darlington County', 7, 'Driving into Darlington County
Me and Wayne on the Fourth of July
Driving into Darlington County
Lookin'' for some work on the county line
We drove down from New York City
Where the girls are pretty but they just wanna know your name
Driving into Darlington City
Got a union connection with an uncle of Wayne''s
We drove eight hundred miles without seeing a cop
We got rock''n''roll music blasting off the t top

Singing sha la la, sha la la la la la
sha la la la la la la
sha la la, sha la la la la la
sha la la la la la la

Hey little girl, standing on the corner
Today''s your lucky day for shure, all right
Me and my buddy, we''re from New York City
We got two hundred dollars, we want to rock all night
Girl, you''re lookin'' at two big spenders
Why, the world don''t know what me and Wayne might do
Our pa''s each own one of the World Trade Centers
For a kiss and a smile I''ll give mine all to you
C''mon baby, take a seat on the fender, it''s a long night
Tell me, what else were you gonna do?
Just me and you, we could ...

Singing sha la la, sha la la la la la
sha la la la la la la
sha la la, sha la la la la la
sha la la la la la la

Little girl, sittin'' in the window
Ain''t seen my buddy in seven days
County man tells me the same thing
He don''t work, and he don''t get paid
Little girl, you''re so young and pretty
Walk with me and you can have your way
Then we''ll leave this Darlington City
For a ride down that Dixie Highway

Singing sha la la, sha la la la la la
sha la la la la la la
sha la la, sha la la la la la
sha la la la la la la

Driving out of Darlington County
My eyes seen the glory of the coming Lord
Driving out of Darlington County
Seen Wayne handcuffed to the bumper of a state trooper''s Ford

Singing sha la la, sha la la la la la
sha la la la la la la
sha la la, sha la la la la la
sha la la la la la la'),




('Working on the Highway', 7, 'Friday night''s pay night guys fresh out of work
Talking about the weekend scrubbing off the dirt
Some heading home to their families some looking to get hurt
Some going down to Stovell wearing trouble on their shirts

I work for the county out on 95
All day I hold a red flag and watch the traffic pass me by
In my head I keep a picture of a pretty little miss
Someday mister I''m gonna lead a better life than this

Working on the highway laying down the blacktop
Working on the highway all day long I don''t stop
Working on the highway blasting through the bedrock
Working on the highway, working on the highway

I met her at a dance down at the union hall
She was standing with her brothers back up against the wall
Sometimes we''d go walking down the union tracks
One day I looked straight at her and she looked straight back

Working on the highway...

I saved up my money and I put it all away
I went to see her daddy but we didn''t have much to say
"Son can''t you see that she''s just a little girl
She don''t know nothing about this cruel cruel world"

We lit out down to Florida we got along all right
One day her brothers came and got her and they took me in a black and white

The prosecutor kept the promise that he made on that day
And the judge got mad and he put me straight away
I wake up every morning to the work bell clang
Me and the warden go swinging on the Charlotte County road gang

Working on the highway...'),




('Downbound Train', 7, 'I had a job, I had a girl
I had something going, mister, in this world
I got laid off down at the lumber yard
Our love went bad, times got hard
Now I work down at the car wash
Where all it ever does is rain
Don''t you feel like you''re a rider on a downbound train

She just said, "Joe, I gotta go
We had it once, we ain''t got it anymore"
She packed her bags, left me behind
She bought a ticket on the Central Line

Nights as I sleep, I hear that whistle whining
I feel her kiss in the misty rain
And I feel like I''m a rider on a downbound train

Last night I heard your voice
You were crying, crying, you were so alone
You said your love had never died
You were waiting for me at home
Put on my jacket, I ran through the woods
I ran till I thought my chest would explode
There in the clearing, beyond the highway
In the moonlight, our wedding house shone

I rushed through the yard
I burst through the front door, my head pounding hard
Up the stairs I climbed
The room was dark, our bed was empty
Then I heard that long whistle whine
And I dropped
to my knees
hung my head and cried

Now I swing a sledge hammer on a railroad gang
Knocking down them cross ties, working in the rain
Now, don''t it feel like you''re a rider on a downbound train'),




('I''m on Fire', 7, 'Hey little girl, is your daddy home?
Did he go away and leave you all alone? Mhmm
I got a bad desire
Oh oh oh, I''m on fire

Tell me now, baby, is he good to you?
And can he do to you the things that I do? Oh no
I can take you higher
Oh oh oh, I''m on fire

Sometimes it''s like someone took a knife, baby
Edgy and dull and cut a six inch valley
Through the middle of my skull

At night I wake up with the sheets soaking wet
And a freight train running through the middle of my head
Only you can cool my desire

Oh oh oh, I''m on fire
Oh oh oh, I''m on fire
Oh oh oh, I''m on fire

Woo ooh ooh
Woo ooh ooh
Ooh ooh ooh
Woo ooh ooh
Woo ooh ooh'),




('No Surrender', 7, 'Well, we busted out of class
Had to get away from those fools
We learned more from a three-minute record, baby
Than we ever learned in school

Tonight I hear the neighborhood drummer sound
I can feel my heart begin to pound
You say you''re tired and you just want to close your eyes
And follow your dreams down

Well, we made a promise we swore we''d always remember
No retreat, baby, no surrender
Like soldiers in the winter''s night with a vow to defend
No retreat, baby, no surrender

Well, now young faces grow sad and old
And hearts of fire grow cold
We swore blood brothers against the wind
Now I''m ready to grow young again

And hear your sister''s voice calling us home
Across the open yards
Well maybe we''ll cut someplace of our own
With these drums and these guitars

''Cause we made a promise we swore we''d always remember
No retreat, baby, no surrender
Blood brothers in the stormy night with a vow to defend
No retreat, baby, no surrender

Now on the street tonight the lights grow dim
The walls of my room are closing in
There''s a war outside still raging
You say it ain''t ours anymore to win

I want to sleep beneath
Peaceful skies in my lover''s bed
With a wide open country in my eyes
And these romantic dreams in my head

Once we made a promise we swore we''d always remember
No retreat, baby, no surrender
Blood brothers in a stormy night with a vow to defend
No retreat, baby, no surrender
No retreat, baby, no surrender'),




('Bobby Jean', 7, 'Well I came by your house the other day
Your mother said you went away
She said there was nothing that I could have done
There was nothing nobody could say

Now me and you we''ve known each other
Ever since we were sixteen
I wished I would have known
I wished I could have called you
Just to say goodbye
Bobby Jean

Now you hung with me when all the others
Turned away turned up their nose
We like the same music we like the same bands
We like the same clothes
We told each other that we were the wildest
The wildest things we''d ever seen
Now I wished I could have talked to you
Just to say goodbye Bobby Jean

Now we went walking in the rain talking about the pain
From the world we hid
Now there ain''t nobody nowhere nohow gonna ever understand me
They way you did
Maybe you''ll be out there on that road somewhere
In some bus or train traveling along
In some motel room there''ll be a radio playing
And you''ll hear me sing this song
Well if you do you''ll know I''m thinking of you
And all the miles in between
And I''m just calling one last time
Not to change your mind
But just to say I miss you baby
Good luck, goodbye
Bobby Jean'),




('I''m Going Down', 7, 'We sit in the car outside your house
I can feel the heat coming ''round
I go to put my arm around you
And you give me a look like I''m way out of bounds
Well you let out one of your bored sighs
Well lately when I look into your eyes
I''m goin down, down, down, down
I''m goin down, down, down, down
I''m goin down, down, down, down
I''m goin down, down, down, down

We get dressed up and we go out, baby, for the night
We come home early burning, burning, burning in some firefight
I''m sick and tired of you setting me up yeah
Setting me up just to knock-a knock-a knock-a me down, down, down, down
I''m goin down, down, down, down
I''m goin down, down, down, down
I''m goin down, down, down, down, hey now

I pull you close now baby
But when we kiss I can feel a doubt
I remember back when we started
My kisses used to turn you inside out

I used to drive you to work in the morning
Friday night I''d drive you all around
You used to love to drive me wild yeah
But lately girl you get your kicks from just driving me down, down, down, down
I''m goin down, down, down, down
I''m goin down, down, down, down
I''m goin down, down, down, down

I''m goin down, down, down, down
I''m goin down, down, down, down
I''m goin down, down, down, down
I''m goin down, hey bopa d-d-down
I''m goin down, down, down, down
I''m goin down, hey bopa d-d-down
I''m goin down, down, down, yeah
I''m goin down, down, hey bopa hey bopa
Hey hey mmm bopa bopa well down
Hey babe mmm bopa bopa said down
Hey hey mmm bopa bopa well down
Hey hey mmm bopa bopa say
Hey unh say down, down, down, down, down
Hey down now, say down, down, down, down, down'),




('Glory Days', 7, 'I had a friend was a big baseball player back in high school
he could throw that speedball by you
Make you look like a fool
Saw him the other night at this roadside bar I was walking in
And he was walking out
We went back inside sat down
Had a few drinks but all he kept talking about was

Glory days well they''ll pass you by
Glory days in the wink of a young girl''s eye
Glory days, glory days

There''s a girl that lives up the block
back in school
She could turn all the boys'' heads
Sometimes on a Friday I''ll stop by and have a few drinks
After she put her kids to bed
Her and her husband Bobby well they split up
I guess it''s two years gone by now
We just sit around talking about the old times, she says
when she feels like crying she starts laughing thinking about

Glory days well they''ll pass you by
Glory days in the wink of a young girl''s eye
Glory days
Glory days

Think I''m going down to the well tonight
And I''m going to drink till I get my fill
And I hope when I get old I don''t sit around thinking about it
But I probably will
Yeah just sitting back trying to recapture a little of the glory of
But time slips away and leaves you with nothing mister
But boring old stories of glory days

Glory days well they''ll pass you by
Glory days in the wink of a young girl''s eye
Glory days, glory days'),




('Dancing in the Dark', 7, 'I get up in the evening
And I ain''t got nothing to say
I come home in the morning
I go to bed feeling the same way
I ain''t got nothing but tired
Man I''m just tired and bored with myself
Hey there baby I could use just a little help

You can''t start a fire
You can''t start a fire without a spark
This gun''s for hire
Even if we''re just dancing in the dark

Message keeps getting clearer
Radio''s on and I''m moving ''round the place
I check my look in the mirror
I wanna change my clothes, my hair, my face
Man I ain''t getting nowhere just living in a dump like this
There''s something happening somewhere
Baby I just know that there is

You can''t start a fire
You can''t start a fire without a spark
This gun''s for hire
Even if we''re just dancing in the dark

You sit around getting older
There''s a joke here somewhere and it''s on me
I''ll shake this world off my shoulders
Come on now baby the laugh''s on me
Stay on the streets of this town
And they''ll be carving you up all right
They say you gotta stay hungry
Hey baby I''m just about starving tonight
I''m dying for some action
I''m sick of sitting ''round here trying to write this book
I need a love reaction
Come on now baby gimme just one look

You can''t start a fire
Sitting ''round crying over a broken heart
This gun''s for hire
Even if we''re just dancing in the dark
You can''t start a fire
Worrying about your little world falling apart
This gun''s for hire
Even if we''re just dancing in the dark'),




('My Hometown', 7, 'I was eight years old and running with a dime in my hand
To the bus stop to pick up a paper for my old man
I''d sit on his lap
In that big old Buick
And steer as we drove through town
He''d tousle my hair
And say son take a good look around
This is your hometown
This is your hometown
This is your hometown
This is your hometown

In ''65 tension was running high at my high school
There was a lot of fights between the black and white
There was nothing you could do
Two cars at a light
On a Saturday night
In the back seat there was a gun
Words were passed
In a shotgun blast
Troubled times had come to my hometown
My hometown
My hometown
My hometown

Now Main Street''s whitewashed windows and vacant stores
Seems like there ain''t nobody wants to come down here no more
They''re closing down the textile mill across the railroad tracks
Foreman says these jobs are going boys and they ain''t coming back
To your hometown
Your hometown
Your hometown
Your hometown

Last night me and Kate we laid in bed
Talking about getting out
Packing up our bags maybe heading south
I''m thirty-five, we got a boy of our own now
Last night I sat him up behind the wheel
And said son take a good look around
This is your hometown');

insert into "songs" ("song_name", "album_id", "song_lyrics") values
('Thunder Road', 3,
'The screen door slams
Mary''s dress sways
Like a vision she dances across the porch
As the radio plays
Roy Orbison singing for the lonely
Hey that''s me and I want you only
Don''t turn me home again
I just can''t face myself alone again

Don''t run back inside, darling
You know just what I''m here for
So you''re scared and you''re thinking
That maybe we ain''t that young anymore
Show a little faith, there''s magic in the night
You ain''t a beauty, but hey you''re alright
Oh and that''s alright with me

You can hide ''neath your covers
And study your pain
Make crosses from your lovers
Throw roses in the rain
Waste your summer praying in vain
For a savior to rise from these streets

Well now I''m no hero
That''s understood
All the redemption I can offer, girl,
Is beneath this dirty hood
With a chance to make it good somehow
Hey what else can we do now
Except roll down the window
And let the wind blow back your hair
Well the night''s busting open
These two lanes will take us anywhere
We got one last chance to make it real
To trade in these wings on some wheels
Climb in back
Heaven''s waiting on down the tracks

Oh-oh come take my hand
We''re riding out tonight to case the promised land
Oh-oh Thunder Road
Oh Thunder Road
Oh Thunder Road
Lying out there like a killer in the sun
Hey I know it''s late we can make it if we run
Oh Thunder Road
Sit tight
Take hold
Thunder Road

Well I got this guitar
And I learned how to make it talk
And my car''s out back
If you''re ready to take that long walk
From your front porch to my front seat
The door''s open but the ride it ain''t free
And I know you''re lonely
For words that I ain''t spoken
But tonight we''ll be free
All the promises''ll be broken

There were ghosts in the eyes
Of all the boys you sent away
They haunt this dusty beach road
In the skeleton frames of burned out Chevrolets
They scream your name at night in the street
Your graduation gown lies in rags at their feet
And in the lonely cool before the dawn
You hear their engines roaring on
But when you get to the porch they''re gone
On the wind

So Mary climb in
It''s a town full of losers
We''re pulling out of here to win'),

('Tenth Avenue Freeze-out', 3,
'Tear drops on the city
Bad Scooter searching for his groove
Seem like the whole world walking pretty
And you can''t find the room to move
Well everybody better move over, that''s all
I''m running on the bad side
And I got my back to the wall
Tenth Avenue freeze-out, Tenth Avenue freeze-out

I''m stranded in the jungle
Taking all the heat they was giving
The night is dark but the sidewalk''s bright
And lined with the light of the living
From a tenement window a transistor blasts
Turn around the corner things got real quiet real fast
She hit me with a Tenth Avenue freeze-out
Tenth Avenue freeze-out
And I''m all alone, I''m all alone
And kid you better get the picture
And I''m on my own, I''m on my own
And I can''t go home

When the change was made uptown
And the Big Man joined the band
From the coastline to the city
All the little pretties raise their hands
I''m gonna sit back right easy and laugh
When Scooter and the Big Man bust this city in half
With a Tenth Avenue freeze-out, Tenth Avenue freeze-out
Tenth Avenue freeze-out...'),

('Born to Run', 3,
'In the day we sweat it out in the streets of a runaway American dream
At night we ride through mansions of glory in suicide machines
Sprung from cages out on Highway Nine
Chrome wheeled, fuel injected and steppin'' out over the line
Baby this town rips the bones from your back
It''s a death trap, it''s a suicide rap
We gotta get out while we''re young
''Cause tramps like us, baby we were born to run

Wendy let me in I wanna be your friend
I want to guard your dreams and visions
Just wrap your legs round these velvet rims
and strap your hands across my engines
Together we could break this trap
We''ll run till we drop, baby we''ll never go back
Will you walk with me out on the wire
''Cause baby I''m just a scared and lonely rider
But I gotta find out how it feels
I want to know if love is wild, girl I want to know if love is real

Beyond the Palace hemi-powered drones scream down the boulevard
The girls comb their hair in rearview mirrors
And the boys try to look so hard
The amusement park rises bold and stark
Kids are huddled on the beach in a mist
I wanna die with you Wendy on the streets tonight
In an everlasting kiss

The highway''s jammed with broken heroes on a last chance power drive
Everybody''s out on the run tonight but there''s no place left to hide
Together Wendy we''ll live with the sadness
I''ll love you with all the madness in my soul
Someday girl I don''t know when we''re gonna get to that place
Where we really want to go and we''ll walk in the sun
But till then, tramps like us baby we were born to run'),

('Night', 3,
'You get up every morning at the sound of the bell
You get to work late and the boss man''s giving you hell
Till you''re out on a midnight run
Losing your heart to a beautiful one
And it feels right as you lock up the house
Turn out the lights and step out into the night

And the world is busting at its seams
And you''re just a prisoner of your dreams
Holding on for your life ''cause you work all day
To blow ''em away in the night

The rat traps filled with soul crusaders
The circuits lined and jammed with chromed invaders
And she''s so pretty that you''re lost in the stars
As you jockey your way through the cars
And sit at the light, as it changes to green
With your faith in your machine off you scream into the night

And you''re in love with all the wonder it brings
And every muscle in your body sings as the highway ignites
You work nine to five and somehow you survive till the night
Hell all day they''re busting you up on the outside
But tonight you''re gonna break on through to the inside
And it''ll be right, it''ll be right, and it''ll be tonight

And you know she will be waiting there
And you''ll find her somehow you swear
Somewhere tonight you run sad and free
Until all you can see is the night'),

('She''s the One', 3,
'With her killer graces and her secret places
That no boy can fill with her hands on her hips
Oh and that smile on her lips
Because she knows that it kills me
With her soft french cream
Standing in that doorway like a dream
I wish she''d just leave me alone
Because french cream won''t soften them boots
And french kisses will not break that heart of stone
With her long hair falling
And her eyes that shine like a midnight sun
Oh-o she''s the one, she''s the one

That Thunder in your heart
At night when you''re kneeling in the dark
It says you''re never gonna leave her
But there''s this angel in her eyes
That tells such desperate lies
And all you want to do is believe her
And tonight you''ll try just one more time
To leave it all behind and to break on through
Oh she can take you, but if she wants to break you
She''s gonna find out that ain''t so easy to do
And no matter where you sleep tonight or how far you run
Oh-o she''s the one, she''s the one

Oh-o and just one kiss
She''d fill them long summer nights
With her tenderness that secret pact you made
Back when her love could save you from the bitterness
Oh she''s the one, oh she''s the one
Oh she''s the one, oh she''s the one
Oh she''s the one, oh she''s the one'),

('Meeting Across the River', 3,
'Hey, Eddie, can you lend me a few bucks
And tonight can you get us a ride
Gotta make it through the tunnel
Got a meeting with a man on the other side

Hey Eddie, this guy, he''s the real thing
So if you want to come along
You gotta promise you won''t say anything
''Cause this guy don''t dance
And the word''s been passed this is our last chance

We gotta stay cool tonight, Eddie
''Cause man, we got ourselves out on that line
And if we blow this one
They ain''t gonna be looking for just me this time

And all we gotta do is hold up our end
Here stuff this in your pocket
It''ll look like you''re carrying a friend
And remember, just don''t smile
Change your shirt, ''cause tonight we got style

Well Cherry says she''s gonna walk
''Cause she found out I took her radio and hocked it
But Eddie, man, she don''t understand
That two grand''s practically sitting here in my pocket

And tonight''s gonna be everything that I said
And when I walk through that door
I''m just gonna throw that money on the bed
She''ll see this time I wasn''t just talking
Then I''m gonna go out walking

Hey Eddie, can you catch us a ride?'),


('Backstreets', 3,
'One soft infested summer me and Terry became friends
Trying in vain to breathe the fire we was born in
Catching rides to the outskirts tying faith between our teeth
Sleeping in that old abandoned beach house getting wasted in the heat
And hiding on the backstreets, hiding on the backstreets
With a love so hard and filled with defeat
Running for our lives at night on them backstreets

Slow dancing in the dark on the beach at Stockton''s Wing
Where desperate lovers park we sat with the last of the Duke Street Kings
Huddled in our cars waiting for the bells that ring
In the deep heart of the night to set us loose from everything
to go running on the backstreets, running on the backstreets
We swore we''d live forever on the backstreets we take it together

Endless juke joints and Valentino drag where dancers scraped the tears
Up off the street dressed down in rags running into the darkness
Some hurt bad some really dying at night sometimes it seemed
You could hear the whole damn city crying blame it on the lies that killed us
Blame it on the truth that ran us down you can blame it all on me Terry
It don''t matter to me now when the breakdown hit at midnight
There was nothing left to say but I hated him and I hated you when you went away

Laying here in the dark you''re like an angel on my chest
Just another tramp of hearts crying tears of faithlessness
Remember all the movies, Terry, we''d go see
Trying to learn how to walk like heroes we thought we had to be
And after all this time to find we''re just like all the rest
Stranded in the park and forced to confess
To hiding on the backstreets, hiding on the backstreets
We swore forever friends on the backstreets until the end
Hiding on the backstreets, hiding on the backstreets'),

('Jungleland', 3,
'The rangers had a homecoming
In Harlem late last night
And the Magic Rat drove his sleek machine
Over the Jersey state line
Barefoot girl sitting on the hood of a Dodge
Drinking warm beer in the soft summer rain
The Rat pulls into town rolls up his pants
Together they take a stab at romance and disappear down Flamingo Lane

Well the Maximum Lawman run down Flamingo
Chasing the Rat and the barefoot girl
And the kids round here look just like shadows
Always quiet, holding hands
From the churches to the jails
Tonight all is silence in the world
As we take our stand
Down in Jungleland

The midnight gang''s assembled
And picked a rendezvous for the night
They''ll meet ''neath that giant Exxon sign
That brings this fair city light
Man there''s an opera out on the Turnpike
There''s a ballet being fought out in the alley
Until the local cops, Cherry Tops, rip this holy night
The street''s alive as secret debts are paid
Contacts made, they vanished unseen
Kids flash guitars just like switchblades
Hustling for the record machine
The hungry and the hunted explode into rock''n''roll bands
That face off against each other out in the street
Down in Jungleland

In the parking lot the visionaries dress in the latest rage
Inside the backstreet girls are dancing to the records that the D.J. plays
Lonely-hearted lovers struggle in dark corners
Desperate as the night moves on, just a look and a whisper, and they''re gone

Beneath the city two hearts beat
Soul engines running through a night so tender
In a bedroom locked come whispers of soft refusal and then surrender
In the tunnels uptown the Rat''s own dream guns him down
As shots echo down them hallways in the night
No one watches when the ambulance pulls away
Or as the girl shuts out the bedroom light

Outside the street''s on fire in a real death waltz
Between what''s flesh and what''s fantasy
And the poets down here don''t write nothing at all
They just stand back and let it all be
And in the quick of the night they reach for their moment
And try to make an honest stand
But they wind up wounded, not even dead
Tonight in Jungleland');

insert into "songs" ("song_name", "album_id", "song_lyrics") values ('The Ties That Bind', 5,

'You been hurt and you''re all cried out you say
You walk down the street pushin'' people outta your way
You packed your bags and all alone you wanna ride,
You don''t want nothin'', don''t need no one by your side
You''re walkin'' tough baby, but you''re walkin'' blind

[chorus]
The ties that bind
Now you can''t break the ties that bind

Cheap romance, it''s all just a crutch
You don''t want nothin'' that anybody can touch
You''re so afraid of being somebody''s fool
Not walkin'' tough baby, not walkin'' cool
You walk cool, but darlin'', can you walk the line
And face the ties that bind
The ties that bind
Now you can''t break the ties that bind

I would rather feel the hurt inside, yes I would darlin'',
Than know the emptiness your heart must hide,
Yes I would darlin'', yes I would darlin'',
Yes I would baby

You sit and wonder just who''s gonna stop the rain
Who''ll ease the sadness, who''s gonna quiet the pain
It''s a long dark highway and a thin white line
Connecting baby, your heart to mine
We''re runnin'' now but darlin'' we will stand in time
To face the ties that bind
The ties that bind
Now you can''t break the ties that bind
You can''t forsake the ties that bind'),

('Sherry Darling', 5,

'Your mama''s yappin'' in the back seat
Tell her to push over and move them big feet
Every Monday morning I gotta drive her down to the unemployment agency
Well this morning I ain''t fighting, tell her I give up
Tell her she wins if she''ll just shut up
But it''s the last time that she''s gonna be ridin'' with me

And you can tell her there''s a hot sun beatin'' on the blacktop
She keeps talkin'', she''ll be walkin'' that last block
She can take a subway back to the ghetto tonight
Well I got some beer and the highway''s free
And I got you, and baby you''ve got me
Hey hey hey, whataya say, Sherry Darlin''

Now there''s girls melting on the beach
And they''re so fine but so out of reach
Cause I''m stuck in traffic down here on 53rd street
Now Sherry my love for you is real
But I didn''t count on this package deal
And baby this car just ain''t big enough for her and me

[chorus]

Well let there be sunlight, let there be rain
Let the brokenhearted love again
Sherry we can run with our arms open wide before the tide
To all the girls down at Sacred Heart
And all you operators back in the Park
Say hey hey hey, whataya say, Sherry Darlin''
Say hey hey hey, whataya say, Sherry Darlin''
Say hey hey hey, whataya say, Sherry Darlin'''),

('Jackson Cage', 5,

'Driving home she grabs something to eat
Turns a corner and drives down her street
Into a row of houses she just melts away
Like the scenery in another man''s play
Into a house where the blinds are closed
To keep from seeing things she don''t wanna know
She pulls the blinds and looks out on the street
The cool of the night takes the edge off the heat

In the Jackson Cage
Down in the Jackson Cage
You can try with all your might
But you''re reminded every night
That you been judged and handed life
Down in the Jackson Cage

Every day ends in wasted motion
Just crossed swords on the killing floor
To settle back is to settle without knowing
The hard edge that you''re settling for
Because there''s always just one more day
And it''s always gonna be that way
Little girl you''ve been down here so long
I can tell by the way that you move you belong to

The Jackson Cage
Down in Jackson Cage
And it don''t matter just what you say
Are you tough enough to play the game they play
Or will you just do your time and fade away
Down into the Jackson Cage

Baby there''s nights when I dream of a better world
But I wake up so downhearted girl
I see you feeling so tired and confused
I wonder what it''s worth to me or you
Just waiting to see some sun
Never knowing if that day will ever come
Left alone standing out on the street
Till you become the hand that turns the key down in

Jackson Cage
Down in Jackson Cage
Well darlin'' can you understand
The way that they will turn a man
Into a stranger to waste away
Down in the Jackson Cage'),

('Two Hearts', 5,

'I went out walking the other day
Seen a little girl crying along the way
She''d been hurt so bad said she''d never love again
Someday your crying girl will end
And you''ll find once again

Two hearts are better than one
Two hearts girl get the job done
Two hearts are better than one

Once I spent my time playing tough guy scenes
But I was living in a world of childish dreams
Someday these childish dreams must end
To become a man and grow up to dream again
Now I believe in the end

Two hearts are better than one...

Sometimes it might seem like it was planned
For you to roam empty hearted through this land
Though the world turns you hard and cold
There''s one thing mister that I know
That''s if you think your heart is stone
And that you''re rough enough to whip this world alone
Alone buddy there ain''t no peace of mind
That''s why I''ll keep searching till I find my special one

Two hearts are better than one...'),

('Independence Day', 5,

'Well Papa go to bed now it''s getting late
Nothing we can say is gonna change anything now
I''ll be leaving in the morning from St. Mary''s Gate
We wouldn''t change this thing even if we could somehow
''Cause the darkness of this house has got the best of us
There''s a darkness in this town that''s got us too
But they can''t touch me now and you can''t touch me now
They ain''t gonna do to me what I watched them do to you

So say goodbye it''s Independence Day
It''s Independence Day all down the line
Just say goodbye it''s Independence Day
It''s Independence Day this time

Now I don''t know what it always was with us
We chose the words and yeah we drew the lines
There was just no way this house could hold the two of us
I guess that we were just too much of the same kind

Well say goodbye it''s Independence Day
All boys must run away come Independence Day
So say goodbye it''s Independence Day
All men must make their way come Independence Day

Now the rooms are all empty down at Frankie''s joint
And the highway she''s deserted down to Breaker''s Point
There''s a lot of people leaving town now
Leaving their friends their homes
At night they walk that dark and dusty highway all alone

Well Papa go to bed now it''s getting late
Nothing we can say can change anything now
Because there''s just different people coming down here now
And they see things in different ways
And soon everything we''ve known will just be swept away

So say goodbye it''s Independence Day
Papa now I know the things you wanted that you could not say
But won''t you just say goodbye it''s Independence Day
I swear I never meant to take those things away'),


('Hungry Heart', 5,

'Got a wife and kids in Baltimore Jack
I went out for a ride and I never went back
Like a river that don''t know where it''s flowing
I took a wrong turn and I just kept going

Everybody''s got a hungry heart
Everybody''s got a hungry heart
Lay down your money and you play your part
Everybody''s got a hungry heart

I met her in a Kingstown bar
We fell in love I knew it had to end
We took what we had and we ripped it apart
Now here I am down in Kingstown again

Everybody''s got a hungry heart...

Everybody needs a place to rest
Everybody wants to have a home
Don''t make no difference what nobody says
Ain''t nobody like to be alone

Everybody''s got a hungry heart...'),

('Out In The Street', 5,

'Put on your best dress baby
And darlin'', fix your hair up right
Cause there''s a party, honey
Way down beneath the neon lights
All day you''ve been working that hard line
Now tonight you''re gonna have a good time

I work five days a week girl
Loading crates down on the dock
I take my hard earned money
And meet my girl down on the block
And Monday when the foreman calls time
I''ve already got Friday on my mind

When that whistle blows
Girl, I''m down the street
I''m home, I''m out of my work clothes
When I''m out in the street
I walk the way I wanna walk
When I''m out in the street
I talk the way I wanna talk
When I''m out in the street
When I''m out in the street

When I''m out in the street, girl
Well, I never feel alone
When I''m out in the street, girl
In the crowd I feel at home
The black and whites they cruise by
And they watch us from the corner of their eye

But there ain''t no doubt girl, down here
We ain''t gonna take what they''re handing out
When I''m out in the street
I walk the way I wanna walk
When I''m out in the street
I talk the way I wanna talk
Baby, out in the street I don''t feel sad or blue
Baby, out in the street I''ll be waiting for you

When the whistle blows
Girl, I''m down the street
I''m home, I''m out of my work clothes
When I''m out in the street
I walk the way I wanna walk
When I''m out in the street
I talk the way I wanna talk

When I''m out in the street
Pretty girls, they''re all passing by
When I''m out in the street
From the corner, we give them the eye

Baby, out in the street I just feel all right
Meet me out in the street, little girl, tonight
Meet me out in the street
Meet me out in the street'),

('Crush On You', 5,

'My feets were flyin'' down the street just the other night
When a Hong Kong special pulled up at the light
What was inside, man, was just c''est magnifique
I wanted to hold the bumper and let her drag me down the street

Ooh, ooh, I gotta crush on you
Ooh, ooh, I gotta crush on you
Ooh, ooh, I gotta crush on you tonight

Sometimes I spot a little stranger standing ''cross the room
My brain takes a vacation just to give my heart more room
For one kiss, darling I swear everything I would give
Cause you''re a walking, talking reason to live

[chorus]

Well now she might be the talk of high society
She''s probably got a lousy personality
She might be a heiress to Rockefeller
She might be a waitress or a bank teller
She makes the Venus de Milo look like she''s got no style
She make Sheena of the Jungle look meek and mild
I need a quick shot, Doc, knock me off my feet
Cause I''ll be minding my own business walking down the street... watchout!

[chorus]'),

('You Can Look (But You Better Not Touch)', 5,

'Yesterday I went shopping buddy down to the mall
Looking for something pretty I could hang on my wall
I knocked over a lamp before it hit the floor I caught it
A salesman turned around said ""Boy you break that thing you bought it""

You can look but you better not touch boy
You can look but you better not touch
Mess around and you''ll end up in dutch boy
You can look but you better not no you better not no you better not touch

Well I came home from work and I switched on channel 5
There was a pretty little girly lookin'' straight into my eyes
Well I watched as she wiggled back and forth across the screen
She didn''t get me excited she just made me feel mean

You can look...

Well I called up Dirty Annie on the telephone
I took her out to the drive-in just to get her alone
I found a lover''s rendezvous the music low set to park
I heard a tappin'' on the window and a voice in the dark

You can look...'),

('I Wanna Marry You', 5,

'I see you walking, baby, down the street
Pushing that baby carriage at your feet
I see the lonely ribbon in your hair
Tell me I am the man for whom you put it there

You never smile girl, you never speak
You just walk on by, darlin'' week after week
Raising two kids alone in this mixed up world
Must be a lonely life for a working girl

Little girl, I wanna marry you
Oh yeah, little girl, I wanna marry you
Yes I do
Little girl, I wanna marry you

Now honey, I don''t wanna clip your wings
But a time comes when two people should think of these things
Having a home and a family
Facing up to their responsibilities
They say in the end true love prevails
But in the end true love can''t be no fairytale
To say I''ll make your dreams come true would be wrong
But maybe, darlin'', I could help them along

[chorus]

My daddy said right before he died
That true, true love was just a lie
He went to his grave a broken heart
An unfulfilled life, makes a man hard

Oh, darlin''
There''s something happy and there''s something sad
''Bout wanting somebody, oh so bad,
I wear my love darlin'', without shame
I''d be proud if you would wear my name'),

('The River' , 5,

'I come from down in the valley where mister when you''re young
They bring you up to do like your daddy done
Me and Mary we met in high school when she was just seventeen
We''d ride out of that valley down to where the fields were green

We''d go down to the river
And into the river we''d dive
Oh down to the river we''d ride

Then I got Mary pregnant and man that was all she wrote
And for my nineteenth birthday I got a union card and a wedding coat
We went down to the courthouse and the judge put it all to rest
No wedding day smiles, no walk down the aisle,
No flowers, no wedding dress
That night we went down to the river
And into the river we''d dive
Oh down to the river we did ride

I got a job working construction for the Johnstown Company
But lately there ain''t been much work on account of the economy
Now all them things that seemed so important
Well mister they vanished right into the air
Now I just act like I don''t remember, Mary acts like she don''t care
But I remember us riding in my brother''s car
Her body tan and wet down at the reservoir
At night on them banks I''d lie awake
And pull her close just to feel each breath she''d take
Now those memories come back to haunt me, they haunt me like a curse
Is a dream a lie if it don''t come true
Or is it something worse that sends me
Down to the river though I know the river is dry
Down to the river, my baby and I
Oh down to the river we ride'),

('Point Blank', 5,

'Do you still say your prayers little darlin'' do you go to bed at night
Prayin'' that tomorrow, everything will be alright
But tommorow''s fall in number in number one by one
You wake up and you''re dying you don''t even know what from

Well they shot you point blank you been shot in the back
Baby point blank you been fooled this time little girl that''s a fact
Right between the eyes baby, point blank right between the pretty lies that they tell
Little girl you fell

You grew up where young girls they grow up fast
You took what you were handed and left behind what was asked
but what they asked baby wasn''t right
you didn''t have to live that life,
I was gonna be your Romeo you were gonna be my Juliet
These days you don''t wait on Romeos you wait on that welfare check
and on all the pretty things that you can''t ever have and on all the promises

That always end up point blank, shot between the eyes
Point blank like little white lies you tell to ease the pain
You''re walkin'' in the sights, girl of point blank
and it''s one false move and baby the lights go out

Once I dreamed we were together again baby you and me
Back home in those old clubs the way we used to be
We were standin'' at the bar it was hard to hear
The band was playin'' loud and you were shoutin'' somethin'' in my ear
You pulled my jacket off and as the drummer counted four
You grabbed my hand and pulled me out on the floor
You just stood there and held me, then you started dancin'' slow
And as I pulled you tighter I swore I''d never let you go

Well I saw you last night down on the avenue
Your face was in the shadows but I knew that it was you
You were standin'' in the doorway out of the rain
You didn''t answer when I called out your name
You just turned, and then you looked away
like just another stranger waitin'' to get blown away

Point blank, right between the eyes
Point blank, right between the pretty lies you fell
Point blank, shot right through the heart

Yea point blank, you''ve been twisted up till you''ve become just another part of it
Point blank, you''re walkin'' in the sights
Point blank, livin'' one false move just one false move away
Point blank, they caught you in their sights
Point blank, did you forget how to love,
girl, did you forget how to fight.
Point blank they must have shot you in the head
Cause point blank, bang bang baby you''re dead.'),

('Cadillac Ranch', 5,

'Well there she sits buddy just a-gleaming in the sun
There to greet a working man when his day is done
I''m gonna pack my pa and I''m gonna pack my aunt
I''m gonna take them down to the Cadillac Ranch

El Dorado fins, whitewalls and skirts
Rides just like a little bit of heaven here on earth
Well buddy when I die throw my body in the back
And drive me to the junkyard in my Cadillac

Cadillac, Cadillac
Long and dark, shiny and black
Open up your engines, let ''em roar
Tearing up the highway like a big old dinosaur

James Dean in that Mercury ''49
Junior Johnson runnin'' through the woods of Caroline
Even Burt Reynolds in that black Trans Am
All gonna meet down at the Cadillac Ranch

[chorus]

Hey little girlie in the blue jeans so tight
Drivin'' alone through the Wisconsin night
You''re my last love, baby you''re my last chance
Don''t let ''em take me to the Cadillac Ranch

[chorus]
Pulled up to my house today
Came and took my little girl away'),

('You Can Look (But You Better Not Touch)', 5,

'Yesterday I went shopping buddy down to the mall
Looking for something pretty I could hang on my wall
I knocked over a lamp before it hit the floor I caught it
A salesman turned around said ""Boy you break that thing you bought it""

You can look but you better not touch boy
You can look but you better not touch
Mess around and you''ll end up in dutch boy
You can look but you better not no you better not no you better not touch

Well I came home from work and I switched on channel 5
There was a pretty little girly lookin'' straight into my eyes
Well I watched as she wiggled back and forth across the screen
She didn''t get me excited she just made me feel mean

You can look...

Well I called up Dirty Annie on the telephone
I took her out to the drive-in just to get her alone
I found a lover''s rendezvous the music low set to park
I heard a tappin'' on the window and a voice in the dark

You can look...'),

('I''m A Rocker', 5,

'I got a 007 watch and it''s a one and only
It''s got a I-Spy beeper that tells me when you''re lonely
I got a Batmobile so I can reach ya'' in a fast shake
When your world''s in crisis of an impendin'' heartbreak

Now don''t you call James Bond or Secret Agent Man
Cause they can''t do it, like I can
I''m a rocker, baby, I''m a rocker - every day
I''m a rocker, baby, I''m a rocker

If you''re hanging from a cliff or you''re tied to the tracks, girl
Columbo split and you can''t find Kojak
True love is broken and your tears are fallin'' faster
You''re sufferin'' from a pain in your heart or some other natural disaster

Now I don''t care what kind of shape you''re in
If they put up a roadblock, I''ll parachute in
I''m a rocker, baby, I''m a rocker - I''m in love
I''m a rocker, baby, I''m a rocker - every day
I''m a rocker, baby, I''m a rocker - with you

So you fell for some jerk who was tall, dark and handsome
Then he kidnapped your heart and now he''s holdin'' it for ransom
Well, like a mission impossible I''m gonna go and get it back
You know I would''a taken better care of it, baby, than that

Sometimes I get so hot girl, well, I can''t talk
But when I''m with you I cool off, and I walk
I''m a rocker, baby, I''m a rocker, and I talk
I''m a rocker, baby, I''m a rocker, every day
I''m a rocker, baby, I''m a rocker, every day'),

('Fade Away', 5,

'Well now you say you''ve found another man who does things to you that I can''t
And that no matter what I do it''s all over now between me and you girl
But I can''t believe what you say
No I can''t believe what you say
''cause baby

I don''t wanna fade away
Oh I don''t wanna fade away
Tell me what can I do what can I say
Cause darlin'' I don''t wanna fade away

Well now you say that you''ve made up your mind
it''s been such a long, long time since it''s been good with us
And that somewhere back along the line you lost your love and I lost your trust
Now rooms that once were so bright are filled with the coming night, darlin''

[chorus]

You say it''s not easy for you
And that you''ve been so lonely
While other girls go out doing what they want to do
You say that you miss the nights when we''d go out dancing
The days when you and I walked as two
Well girl I miss them too
Oh I swear that I do
Oh girl

Now baby I don''t wanna be just another useless memory holding you tight
Or just some other ghost out on the street to whom you stop and
politely speak when you pass on by vanishing into the night
left to vanish into the night
No baby'),


('Stolen Car', 5,

'I met a little girl and I settled down
In a little house out on the edge of town
We got married, and swore we''d never part
Then little by little we drifted from each other''s heart

At first I thought it was just restlessness
That would fade as time went by and our love grew deep
In the end it was something more I guess
That tore us apart and made us weep

And I''m driving a stolen car
Down on Eldridge Avenue
Each night I wait to get caught
But I never do

She asked if I remembered the letters I wrote
When our love was young and bold
She said last night she read those letters
And they made her feel one hundred years old

And I''m driving a stolen car
On a pitch black night
And I''m telling myself I''m gonna be alright
But I ride by night and I travel in fear
That in this darkness I will disappear'),

('Ramrod', 5,

'Hey, little dolly with the blue jeans on
I wanna ramrod with you honey, till half-past dawn
Let your hair down sugar and pick up this beat
Come on and meet me tonight down on Bluebird Street
I''ve been working all week, I''m up to my neck in hock
Come Saturday night I let my ramrod rock

She''s a hot stepping hemi with a four on the floor
She''s a roadrunner engine in a ''32 Ford
Late at night when I''m dead on the line
I swear I think of your pretty face when I let her unwind
Well look over yonder see them city lights
Come on little dolly ''n'' go ramroddin'' tonight

Come on, come on, come on little baby
Come on, come on let''s shake it tonight
Come on, come, come on little sugar
Dance with your daddy and we''ll go ramroddin'' tonight

Hey, little dolly won''t you say you will
Meet me tonight up on top of the hill
Well just a few miles cross the county line
There''s a cute little chapel nestled down in the pines
Say you''ll be mine little girl I''ll put my foot to the floor
Give me the word now sugar, we''ll go ramroddin'' forever more'),

('The Price You Pay', 5,

'You make up your mind, you choose the chance you take
You ride to where the highway ends and the desert breaks
Out on to an open road you ride until the day
You learn to sleep at night with the price you pay

Now with their hands held high, they reached out for the open skies
And in one last breath they built the roads they''d ride to their death
Driving on through the night, unable to break away
From the restless pull of the price you pay

[chorus]
Oh, the price you pay, oh, the price you pay
Now you can''t walk away from the price you pay

Now they''d come so far and they''d waited so long
Just to end up caught in a dream where everything goes wrong
Where the dark of night holds back the light of day
And you''ve gotta stand and fight for the price you pay

[chorus]

Little girl down on the strand
With that pretty little baby in your hands
Do you remember the story of the promised land
How he crossed the desert sands
And could not enter the chosen land
On the banks of the river he stayed
To face the price you pay

So let the games start, you better run you little wild heart
You can run through all the nights and all the days
But just across the county line, a stranger passing through put up a sign
That counts the men fallen away to the price you pay,
and girl before the end of the day,
I''m gonna tear it down and throw it away'),

('Drive All Night', 5,

'When I lost you honey sometimes I think lost my guts too
And I wish God would send me a word send me something I''m afraid to lose
Lying in the heat of the night like prisoners all our lives
I get shivers down my spine and all
I wanna do is hold you tight

I swear I''ll drive all night just to buy you some shoes
And to taste your tender charms
And I just wanna sleep tonight again in your arms

Tonight there''s fallen angels and they''re waiting for us down in the street
Tonight there''s calling strangers, hear them crying in defeat.
Let them go, let them go, let them go, do their dances of the dead (let''em go right ahead)
You just dry your eyes girl, and c''mon c''mon c''mon let''s go to bed, baby, baby, baby

[chorus]

There''s machines and there''s fire waiting on the edge of town
They''re out there for hire but baby they can''t hurt us now
Cause you''ve got, you''ve got, you''ve got, you''ve got my love, you''ve got my love
Through the wind, through the rain, the snow, the wind, the rain
You''ve got, you''ve got my, my love heart and soul'),


('Wreck On The Highway', 5,

'Last night I was out driving
Coming home at the end of the working day
I was riding alone through the drizzling rain
On a deserted stretch of a county two-lane
When I cam upon a wreck on the highway

There was blood and glass all over
And there was nobody there but me
As the rain tumbled down hard and cold
I seen a young man lying by the side of the road
He cried Mister, won''t you help me please

An ambulance finally came and took him to Riverside
I watched as they drove him away
And I thought of a girlfriend or a young wife
And a state trooper knocking in the middle of the night
To say your baby died in a wreck on the highway

Sometimes I sit up in the darkness
And I watch my baby as she sleeps
Then I climb in bed and I hold her tight
I just lay there awake in the middle of the night
Thinking ''bout the wreck on the highway');


alter sequence songs_song_id_seq restart with 100;

alter sequence songs_song_id_seq restart with 200;

insert into "lyrics_fragments" ("fragment_text", "song_id", "rhyme") values ('The screen door slams', 1, 'ams'),('Mary''s dress sways', 1, 'ays'),('Like a vision she dances across the porch', 1, 'orch'),('As the radio plays', 1, 'ays'),('Roy Orbison singing for the lonely', 1, 'onely'),('Hey that''s me and I want you only', 1, 'only'),('Don''t turn me home again', 1, 'again'),('I just can''t face myself alone again', 1, 'again'),('Don''t run back inside, darling', 1, 'arling'),('You know just what I''m here for', 1, 'or'),('So you''re scared and you''re thinking', 1, 'inking'),('That maybe we ain''t that young anymore', 1, 'anymore'),('Show a little faith, there''s magic in the night', 1, 'ight'),('You ain''t a beauty, but hey you''re alright', 1, 'alright'),('Oh and that''s alright with me', 1, 'e'),('You can hide ''neath your covers', 1, 'overs'),('And study your pain', 1, 'ain'),('Make crosses from your lovers', 1, 'overs'),('Throw roses in the rain', 1, 'ain'),('Waste your summer praying in vain', 1, 'ain'),('For a savior to rise from these streets', 1, 'eets'),('Well now I''m no hero', 1, 'ero'),('That''s understood', 1, 'understood'),('All the redemption I can offer, girl,', 1, 'irl,'),('Is beneath this dirty hood', 1, 'ood'),('With a chance to make it good somehow', 1, 'omehow'),('Hey what else can we do now', 1, 'ow'),('Except roll down the window', 1, 'indow'),('And let the wind blow back your hair', 1, 'air'),('Well the night''s busting open', 1, 'open'),('These two lanes will take us anywhere', 1, 'anywhere'),('We got one last chance to make it real', 1, 'eal'),('To trade in these wings on some wheels', 1, 'eels'),('Climb in back', 1, 'ack'),('Heaven''s waiting on down the tracks', 1, 'acks'),('Oh-oh come take my hand', 1, 'and'),('We''re riding out tonight to case the promised land', 1, 'and'),('Oh-oh Thunder Road', 1, 'oad'),('Oh Thunder Road', 1, 'oad'),('Oh Thunder Road', 1, 'oad'),('Lying out there like a killer in the sun', 1, 'un'),('Hey I know it''s late we can make it if we run', 1, 'un'),('Oh Thunder Road', 1, 'oad'),('Sit tight', 1, 'ight'),('Take hold', 1, 'old'),('Thunder Road', 1, 'oad'),('Well I got this guitar', 1, 'uitar'),('And I learned how to make it talk', 1, 'alk'),('And my car''s out back', 1, 'ack'),('If you''re ready to take that long walk', 1, 'alk'),('From your front porch to my front seat', 1, 'eat'),('The door''s open but the ride it ain''t free', 1, 'ee'),('And I know you''re lonely', 1, 'onely'),('For words that I ain''t spoken', 1, 'oken'),('But tonight we''ll be free', 1, 'ee'),('All the promises''ll be broken', 1, 'oken'),('There were ghosts in the eyes', 1, 'eyes'),('Of all the boys you sent away', 1, 'away'),('They haunt this dusty beach road', 1, 'oad'),('In the skeleton frames of burned out Chevrolets', 1, 'evrolets'),('They scream your name at night in the street', 1, 'eet'),('Your graduation gown lies in rags at their feet', 1, 'eet'),('And in the lonely cool before the dawn', 1, 'awn'),('You hear their engines roaring on', 1, 'on'),('But when you get to the porch they''re gone', 1, 'one'),('On the wind', 1, 'ind'),('So Mary climb in', 1, 'in'),('It''s a town full of losers', 1, 'osers'),('We''re pulling out of here to win', 1, 'in');

insert into "lyrics_fragments" ("fragment_text", "song_id", "rhyme") values ('Tear drops on the city', 2, 'ity'),('Bad Scooter searching for his groove', 2, 'oove'),('Seem like the whole world walking pretty', 2, 'etty'),('And you can''t find the room to move', 2, 'ove'),('Well everybody better move over, that''s all', 2, 'all'),('I''m running on the bad side', 2, 'ide'),('And I got my back to the wall', 2, 'all'),('Tenth Avenue freeze-out, Tenth Avenue freeze-out', 2, 'eeze-out'),('I''m stranded in the jungle', 2, 'ungle'),('Taking all the heat they was giving', 2, 'iving'),('The night is dark but the sidewalk''s bright', 2, 'ight'),('And lined with the light of the living', 2, 'iving'),('From a tenement window a transistor blasts', 2, 'asts'),('Turn around the corner things got real quiet real fast', 2, 'ast'),('She hit me with a Tenth Avenue freeze-out', 2, 'eeze-out'),('Tenth Avenue freeze-out', 2, 'eeze-out'),('And I''m all alone, I''m all alone', 2, 'alone'),('And kid you better get the picture', 2, 'icture'),('And I''m on my own, I''m on my own', 2, 'own'),('And I can''t go home', 2, 'ome'),('When the change was made uptown', 2, 'uptown'),('And the Big Man joined the band', 2, 'and'),('From the coastline to the city', 2, 'ity'),('All the little pretties raise their hands', 2, 'ands'),('I''m gonna sit back right easy and laugh', 2, 'augh'),('When Scooter and the Big Man bust this city in half', 2, 'alf'),('With a Tenth Avenue freeze-out, Tenth Avenue freeze-out', 2, 'eeze-out'),('Tenth Avenue freeze-out...', 2, 'eeze-out...');

alter table "lyrics_fragments" add column rhyme varchar(15);

insert into "lyrics_fragments" ("fragment_text", "song_id", "rhyme") values ('In the day we sweat it out in the streets of a runaway American dream', 3, 'eam'),('At night we ride through mansions of glory in suicide machines', 3, 'achines'),('Sprung from cages out on Highway Nine', 3, 'ine'),('Chrome wheeled, fuel injected and steppin'' out over the line', 3, 'ine'),('Baby this town rips the bones from your back', 3, 'ack'),('It''s a death trap, it''s a suicide rap', 3, 'ap'),('We gotta get out while we''re young', 3, 'oung'),('''Cause tramps like us, baby we were born to run', 3, 'un'),('Wendy let me in I wanna be your friend', 3, 'iend'),('I want to guard your dreams and visions', 3, 'isions'),('Just wrap your legs round these velvet rims', 3, 'ims'),('and strap your hands across my engines', 3, 'engines'),('Together we could break this trap', 3, 'ap'),('We''ll run till we drop, baby we''ll never go back', 3, 'ack'),('Will you walk with me out on the wire', 3, 'ire'),('''Cause baby I''m just a scared and lonely rider', 3, 'ider'),('But I gotta find out how it feels', 3, 'eels'),('I want to know if love is wild, girl I want to know if love is real', 3, 'eal'),('Beyond the Palace hemi-powered drones scream down the boulevard', 3, 'oulevard'),('The girls comb their hair in rearview mirrors', 3, 'irrors'),('And the boys try to look so hard', 3, 'ard'),('The amusement park rises bold and stark', 3, 'ark'),('Kids are huddled on the beach in a mist', 3, 'ist'),('I wanna die with you Wendy on the streets tonight', 3, 'onight'),('In an everlasting kiss', 3, 'iss'),('The highway''s jammed with broken heroes on a last chance power drive', 3, 'ive'),('Everybody''s out on the run tonight but there''s no place left to hide', 3, 'ide'),('Together Wendy we''ll live with the sadness', 3, 'adness'),('I''ll love you with all the madness in my soul', 3, 'oul'),('Someday girl I don''t know when we''re gonna get to that place', 3, 'ace'),('Where we really want to go and we''ll walk in the sun', 3, 'un'),('But till then, tramps like us baby we were born to run', 3, 'un');

insert into "lyrics_fragments" ("fragment_text", "song_id", "rhyme") values ('You get up every morning at the sound of the bell', 4, 'ell'),('You get to work late and the boss man''s giving you hell', 4, 'ell'),('Till you''re out on a midnight run', 4, 'un'),('Losing your heart to a beautiful one', 4, 'one'),('And it feels right as you lock up the house', 4, 'ouse'),('Turn out the lights and step out into the night', 4, 'ight'),('And the world is busting at its seams', 4, 'eams'),('And you''re just a prisoner of your dreams', 4, 'eams'),('Holding on for your life ''cause you work all day', 4, 'ay'),('To blow ''em away in the night', 4, 'ight'),('The rat traps filled with soul crusaders', 4, 'usaders'),('The circuits lined and jammed with chromed invaders', 4, 'invaders'),('And she''s so pretty that you''re lost in the stars', 4, 'ars'),('As you jockey your way through the cars', 4, 'ars'),('And sit at the light, as it changes to green', 4, 'een'),('With your faith in your machine off you scream into the night', 4, 'ight'),('And you''re in love with all the wonder it brings', 4, 'ings'),('And every muscle in your body sings as the highway ignites', 4, 'ignites'),('You work nine to five and somehow you survive till the night', 4, 'ight'),('Hell all day they''re busting you up on the outside', 4, 'outside'),('But tonight you''re gonna break on through to the inside', 4, 'inside'),('And it''ll be right, it''ll be right, and it''ll be tonight', 4, 'onight'),('And you know she will be waiting there', 4, 'ere'),('And you''ll find her somehow you swear', 4, 'ear'),('Somewhere tonight you run sad and free', 4, 'ee'),('Until all you can see is the night', 4, 'ight');

insert into "lyrics_fragments" ("fragment_text", "song_id", "rhyme") values ('With her killer graces and her secret places', 5, 'aces'),('That no boy can fill with her hands on her hips', 5, 'ips'),('Oh and that smile on her lips', 5, 'ips'),('Because she knows that it kills me', 5, 'e'),('With her soft french cream', 5, 'eam'),('Standing in that doorway like a dream', 5, 'eam'),('I wish she''d just leave me alone', 5, 'alone'),('Because french cream won''t soften them boots', 5, 'oots'),('And french kisses will not break that heart of stone', 5, 'one'),('With her long hair falling', 5, 'alling'),('And her eyes that shine like a midnight sun', 5, 'un'),('Oh-o she''s the one, she''s the one', 5, 'one'),('That Thunder in your heart', 5, 'eart'),('At night when you''re kneeling in the dark', 5, 'ark'),('It says you''re never gonna leave her', 5, 'er'),('But there''s this angel in her eyes', 5, 'eyes'),('That tells such desperate lies', 5, 'ies'),('And all you want to do is believe her', 5, 'er'),('And tonight you''ll try just one more time', 5, 'ime'),('To leave it all behind and to break on through', 5, 'ough'),('Oh she can take you, but if she wants to break you', 5, 'ou'),('She''s gonna find out that ain''t so easy to do', 5, 'o'),('And no matter where you sleep tonight or how far you run', 5, 'un'),('Oh-o she''s the one, she''s the one', 5, 'one'),('Oh-o and just one kiss', 5, 'iss'),('She''d fill them long summer nights', 5, 'ights'),('With her tenderness that secret pact you made', 5, 'ade'),('Back when her love could save you from the bitterness', 5, 'itterness'),('Oh she''s the one, oh she''s the one', 5, 'one'),('Oh she''s the one, oh she''s the one', 5, 'one'),('Oh she''s the one, oh she''s the one', 5, 'one') ;

insert into "lyrics_fragments" ("fragment_text", "song_id", "rhyme") values ('Hey, Eddie, can you lend me a few bucks', 6, 'ucks'),('And tonight can you get us a ride', 6, 'ide'),('Gotta make it through the tunnel', 6, 'unnel'),('Got a meeting with a man on the other side', 6, 'ide'),('Hey Eddie, this guy, he''s the real thing', 6, 'ing'),('So if you want to come along', 6, 'along'),('You gotta promise you won''t say anything', 6, 'anything'),('''Cause this guy don''t dance', 6, 'ance'),('And the word''s been passed this is our last chance', 6, 'ance'),('We gotta stay cool tonight, Eddie', 6, 'Eddie'),('''Cause man, we got ourselves out on that line', 6, 'ine'),('And if we blow this one', 6, 'one'),('They ain''t gonna be looking for just me this time', 6, 'ime'),('And all we gotta do is hold up our end', 6, 'end'),('Here stuff this in your pocket', 6, 'ocket'),('It''ll look like you''re carrying a friend', 6, 'iend'),('And remember, just don''t smile', 6, 'ile'),('Change your shirt, ''cause tonight we got style', 6, 'e'),('Well Cherry says she''s gonna walk', 6, 'alk'),('''Cause she found out I took her radio and hocked it', 6, 'it'),('But Eddie, man, she don''t understand', 6, 'understand'),('That two grand''s practically sitting here in my pocket', 6, 'ocket'),('And tonight''s gonna be everything that I said', 6, 'aid'),('And when I walk through that door', 6, 'oor'),('I''m just gonna throw that money on the bed', 6, 'ed'),('She''ll see this time I wasn''t just talking', 6, 'alking'),('Then I''m gonna go out walking', 6, 'alking'),('Hey Eddie, can you catch us a ride?', 6, 'ide?') ;

insert into "lyrics_fragments" ("fragment_text", "song_id", "rhyme") values ('One soft infested summer me and Terry became friends', 7, 'iends'),('Trying in vain to breathe the fire we was born in', 7, 'in'),('Catching rides to the outskirts tying faith between our teeth', 7, 'eeth'),('Sleeping in that old abandoned beach house getting wasted in the heat', 7, 'eat'),('And hiding on the backstreets, hiding on the backstreets', 7, 'ackstreets'),('With a love so hard and filled with defeat', 7, 'efeat'),('Running for our lives at night on them backstreets', 7, 'ackstreets'),('Slow dancing in the dark on the beach at Stockton''s Wing', 7, 'ing'),('Where desperate lovers park we sat with the last of the Duke Street Kings', 7, 'ings'),('Huddled in our cars waiting for the bells that ring', 7, 'ing'),('In the deep heart of the night to set us loose from everything', 7, 'everything'),('to go running on the backstreets, running on the backstreets', 7, 'ackstreets'),('We swore we''d live forever on the backstreets we take it together', 7, 'ogether'),('Endless juke joints and Valentino drag where dancers scraped the tears', 7, 'ears'),('Up off the street dressed down in rags running into the darkness', 7, 'arkness'),('Some hurt bad some really dying at night sometimes it seemed', 7, 'eemed'),('You could hear the whole damn city crying blame it on the lies that killed us', 7, 'us'),('Blame it on the truth that ran us down you can blame it all on me Terry', 7, 'erry'),('It don''t matter to me now when the breakdown hit at midnight', 7, 'idnight'),('There was nothing left to say but I hated him and I hated you when you went away', 7, 'away'),('Laying here in the dark you''re like an angel on my chest', 7, 'est'),('Just another tramp of hearts crying tears of faithlessness', 7, 'aithlessness'),('Remember all the movies, Terry, we''d go see', 7, 'ee'),('Trying to learn how to walk like heroes we thought we had to be', 7, 'e'),('And after all this time to find we''re just like all the rest', 7, 'est'),('Stranded in the park and forced to confess', 7, 'onfess'),('To hiding on the backstreets, hiding on the backstreets', 7, 'ackstreets'),('We swore forever friends on the backstreets until the end', 7, 'end'),('Hiding on the backstreets, hiding on the backstreets', 7, 'ackstreets');

insert into "lyrics_fragments" ("fragment_text", "song_id", "rhyme") values ('The rangers had a homecoming', 8, 'omecoming'),('In Harlem late last night', 8, 'ight'),('And the Magic Rat drove his sleek machine', 8, 'achine'),('Over the Jersey state line', 8, 'ine'),('Barefoot girl sitting on the hood of a Dodge', 8, 'odge'),('Drinking warm beer in the soft summer rain', 8, 'ain'),('The Rat pulls into town rolls up his pants', 8, 'ants'),('Together they take a stab at romance and disappear down Flamingo Lane', 8, 'ane'),('Well the Maximum Lawman run down Flamingo', 8, 'amingo'),('Chasing the Rat and the barefoot girl', 8, 'irl'),('And the kids round here look just like shadows', 8, 'adows'),('Always quiet, holding hands', 8, 'ands'),('From the churches to the jails', 8, 'ails'),('Tonight all is silence in the world', 8, 'orld'),('As we take our stand', 8, 'and'),('Down in Jungleland', 8, 'ungleland'),('The midnight gang''s assembled', 8, 'assembled'),('And picked a rendezvous for the night', 8, 'ight'),('They''ll meet ''neath that giant Exxon sign', 8, 'ign'),('That brings this fair city light', 8, 'ight'),('Man there''s an opera out on the Turnpike', 8, 'urnpike'),('There''s a ballet being fought out in the alley', 8, 'alley'),('Until the local cops, Cherry Tops, rip this holy night', 8, 'ight'),('The street''s alive as secret debts are paid', 8, 'aid'),('Contacts made, they vanished unseen', 8, 'unseen'),('Kids flash guitars just like switchblades', 8, 'itchblades'),('Hustling for the record machine', 8, 'achine'),('The hungry and the hunted explode into rock''n''roll bands', 8, 'ands'),('That face off against each other out in the street', 8, 'eet'),('Down in Jungleland', 8, 'ungleland'),('In the parking lot the visionaries dress in the latest rage', 8, 'age'),('Inside the backstreet girls are dancing to the records that the D.J. plays', 8, 'ays'),('Lonely-hearted lovers struggle in dark corners', 8, 'orners'),('Desperate as the night moves on, just a look and a whisper, and they''re gone', 8, 'one'),('Beneath the city two hearts beat', 8, 'eat'),('Soul engines running through a night so tender', 8, 'ender'),('In a bedroom locked come whispers of soft refusal and then surrender', 8, 'urrender'),('In the tunnels uptown the Rat''s own dream guns him down', 8, 'own'),('As shots echo down them hallways in the night', 8, 'ight'),('No one watches when the ambulance pulls away', 8, 'away'),('Or as the girl shuts out the bedroom light', 8, 'ight'),('Outside the street''s on fire in a real death waltz', 8, 'altz'),('Between what''s flesh and what''s fantasy', 8, 'antasy'),('And the poets down here don''t write nothing at all', 8, 'all'),('They just stand back and let it all be', 8, 'e'),('And in the quick of the night they reach for their moment', 8, 'oment'),('And try to make an honest stand', 8, 'and'),('But they wind up wounded, not even dead', 8, 'ead'),('Tonight in Jungleland', 8, 'ungleland');

insert into lyrics_fragments ("fragment_text", "song_id", "rhyme") values ('Born down in a dead man''s town', 200, 'own'),('The first kick I took was when I hit the ground', 200, 'ound'),('You end up like a dog that''s been beat too much', 200, 'uch'),('Till you spend half your life just covering up', 200, 'up'),('Born in the USA, I was born in the USA', 200, 'USA'),('I was born in the USA, born in the USA', 200, 'USA'),('Got in a little hometown jam', 200, 'am'),('So they put a rifle in my hand', 200, 'and'),('Sent me off to a foreign land', 200, 'and'),('To go and kill the yellow man', 200, 'an'),('Born in the USA...', 200, 'USA...'),('Come back home to the refinery', 200, 'efinery'),('Hiring man said ''Son if it was up to me''', 200, 'e'''),('Went down to see my V.A. man', 200, 'an'),('He said ''Son, don''t you understand''', 200, 'understand'''),('I had a brother at Khe Sahn', 200, 'ahn'),('Fighting off the Viet Cong', 200, 'ong'),('They''re still there, he''s all gone', 200, 'one'),('He had a woman he loved in Saigon', 200, 'aigon'),('I got a picture of him in her arms now', 200, 'ow'),('Down in the shadow of the penitentiary', 200, 'enitentiary'),('Out by the gas fires of the refinery', 200, 'efinery'),('I''m ten years burning down the road', 200, 'oad'),('Nowhere to run ain''t got nowhere to go', 200, 'o'),('Born in the USA, I was born in the USA', 200, 'USA'),('Born in the USA, I''m a long gone Daddy in the USA', 200, 'USA'),('Born in the USA, Born in the USA', 200, 'USA'),('Born in the USA, I''m a cool rocking Daddy in the USA', 200, 'USA'), ('The times are tough now, just getting tougher', 201, 'ougher'),('This old world is rough, it''s just getting rougher', 201, 'ougher'),('Cover me, come on baby, cover me', 201, 'e'),('Well I''m looking for a lover who will come on in and cover me', 201, 'e'),('Promise me baby you won''t let them find us', 201, 'us'),('Hold me in your arms, let''s let our love blind us', 201, 'us'),('Cover me, shut the door and cover me', 201, 'e'),('Well I''m looking for a lover who will come on in and cover me', 201, 'e'),('Outside''s the rain, the driving snow', 201, 'ow'),('I can hear the wild wind blowing', 201, 'owing'),('Turn out the light, bolt the door', 201, 'oor'),('I ain''t going out there no more', 201, 'ore'),('This whole world is out there just trying to score', 201, 'ore'),('I''ve seen enough I don''t want to see any more,', 201, 'ore,'),('Cover me, come on and cover me', 201, 'e'),('I''m looking for a lover who will come on in and cover me', 201, 'e'),('Looking for a lover who will come on in and cover me', 201, 'e'), ('Driving into Darlington County', 202, 'ounty'),('Me and Wayne on the Fourth of July', 202, 'uly'),('Driving into Darlington County', 202, 'ounty'),('Lookin'' for some work on the county line', 202, 'ine'),('We drove down from New York City', 202, 'ity'),('Where the girls are pretty but they just wanna know your name', 202, 'ame'),('Driving into Darlington City', 202, 'ity'),('Got a union connection with an uncle of Wayne''s', 202, 'ayne''s'),('We drove eight hundred miles without seeing a cop', 202, 'op'),('We got rock''n''roll music blasting off the t top', 202, 'op'),('Singing sha la la, sha la la la la la', 202, 'a'),('sha la la la la la la', 202, 'a'),('sha la la, sha la la la la la', 202, 'a'),('sha la la la la la la', 202, 'a'),('Hey little girl, standing on the corner', 202, 'orner'),('Today''s your lucky day for shure, all right', 202, 'ight'),('Me and my buddy, we''re from New York City', 202, 'ity'),('We got two hundred dollars, we want to rock all night', 202, 'ight'),('Girl, you''re lookin'' at two big spenders', 202, 'enders'),('Why, the world don''t know what me and Wayne might do', 202, 'o'),('Our pa''s each own one of the World Trade Centers', 202, 'enters'),('For a kiss and a smile I''ll give mine all to you', 202, 'you'),('C''mon baby, take a seat on the fender, it''s a long night', 202, 'ight'),('Tell me, what else were you gonna do?', 202, 'o?'),('Just me and you, we could', 202, 'ould'),('Singing sha la la, sha la la la la la', 202, 'a'),('sha la la la la la la', 202, 'a'),('sha la la, sha la la la la la', 202, 'a'),('sha la la la la la la', 202, 'a'),('Little girl, sittin'' in the window', 202, 'indow'),('Ain''t seen my buddy in seven days', 202, 'ays'),('County man tells me the same thing', 202, 'ing'),('He don''t work, and he don''t get paid', 202, 'aid'),('Little girl, you''re so young and pretty', 202, 'etty'),('Walk with me and you can have your way', 202, 'ay'),('Then we''ll leave this Darlington City', 202, 'ity'),('For a ride down that Dixie Highway', 202, 'ighway'),('Singing sha la la, sha la la la la la', 202, 'a'),('sha la la la la la la', 202, 'a'),('sha la la, sha la la la la la', 202, 'a'),('sha la la la la la la', 202, 'a'),('Driving out of Darlington County', 202, 'ounty'),('My eyes seen the glory of the coming Lord', 202, 'ord'),('Driving out of Darlington County', 202, 'ounty'),('Seen Wayne handcuffed to the bumper of a state trooper''s Ford', 202, 'ord'),('Singing sha la la, sha la la la la la', 202, 'a'),('sha la la la la la la', 202, 'a'),('sha la la, sha la la la la la', 202, 'a'),('sha la la la la la la', 202, 'a'), ('Friday night''s pay night guys fresh out of work', 203, 'ork'),('Talking about the weekend scrubbing off the dirt', 203, 'irt'),('Some heading home to their families some looking to get hurt', 203, 'urt'),('Some going down to Stovell wearing trouble on their shirts', 203, 'irts'),('I work for the county out on 95', 203, '95'),('All day I hold a red flag and watch the traffic pass me by', 203, 'y'),('In my head I keep a picture of a pretty little miss', 203, 'iss'),('Someday mister I''m gonna lead a better life than this', 203, 'is'),('Working on the highway laying down the blacktop', 203, 'acktop'),('Working on the highway all day long I don''t stop', 203, 'op'),('Working on the highway blasting through the bedrock', 203, 'edrock'),('Working on the highway, working on the highway', 203, 'ighway'),('I met her at a dance down at the union hall', 203, 'all'),('She was standing with her brothers back up against the wall', 203, 'all'),('Sometimes we''d go walking down the union tracks', 203, 'acks'),('One day I looked straight at her and she looked straight back', 203, 'ack'),('Working on the highway...', 203, 'ighway...'),('I saved up my money and I put it all away', 203, 'away'),('I went to see her daddy but we didn''t have much to say', 203, 'ay'),('''Son can''t you see that she''s just a little girl', 203, 'irl'),('She don''t know nothing about this cruel cruel world''', 203, 'orld'''),('We lit out down to Florida we got along all right', 203, 'ight'),('One day her brothers came and got her and they took me in a black and white', 203, 'ite'),('The prosecutor kept the promise that he made on that day', 203, 'ay'),('And the judge got mad and he put me straight away', 203, 'away'),('I wake up every morning to the work bell clang', 203, 'ang'),('Me and the warden go swinging on the Charlotte County road gang', 203, 'ang'),('Working on the highway...', 203, 'ighway...'), ('I had a job, I had a girl', 204, 'irl'),('I had something going, mister, in this world', 204, 'orld'),('I got laid off down at the lumber yard', 204, 'yard'),('Our love went bad, times got hard', 204, 'ard'),('Now I work down at the car wash', 204, 'ash'),('Where all it ever does is rain', 204, 'ain'),('Don''t you feel like you''re a rider on a downbound train', 204, 'ain'),('She just said, ''Joe, I gotta go', 204, 'o'),('We had it once, we ain''t got it anymore''', 204, 'anymore'''),('She packed her bags, left me behind', 204, 'ehind'),('She bought a ticket on the Central Line', 204, 'ine'),('Nights as I sleep, I hear that whistle whining', 204, 'ining'),('I feel her kiss in the misty rain', 204, 'ain'),('And I feel like I''m a rider on a downbound train', 204, 'ain'),('Last night I heard your voice', 204, 'oice'),('You were crying, crying, you were so alone', 204, 'alone'),('You said your love had never died', 204, 'ied'),('You were waiting for me at home', 204, 'ome'),('Put on my jacket, I ran through the woods', 204, 'oods'),('I ran till I thought my chest would explode', 204, 'explode'),('There in the clearing, beyond the highway', 204, 'ighway'),('In the moonlight, our wedding house shone', 204, 'one'),('I rushed through the yard', 204, 'yard'),('I burst through the front door, my head pounding hard', 204, 'ard'),('Up the stairs I climbed', 204, 'imbed'),('The room was dark, our bed was empty', 204, 'empty'),('Then I heard that long whistle whine', 204, 'ine'),('And I dropped', 204, 'opped'),('to my knees', 204, 'ees'),('hung my head and cried', 204, 'ied'),('Now I swing a sledge hammer on a railroad gang', 204, 'ang'),('Knocking down them cross ties, working in the rain', 204, 'ain'),('Now, don''t it feel like you''re a rider on a downbound train', 204, 'ain'), ('Hey little girl, is your daddy home?', 205, 'ome?'),('Did he go away and leave you all alone?', 205, 'alone?'),('I got a bad desire', 205, 'esire'),('Oh oh oh, I''m on fire', 205, 'ire'),('Tell me now, baby, is he good to you?', 205, 'you?'),('And can he do to you the things that I do? Oh no', 205, 'o'),('I can take you higher', 205, 'igher'),('Oh oh oh, I''m on fire', 205, 'ire'),('Sometimes it''s like someone took a knife, baby', 205, 'aby'),('Edgy and dull and cut a six inch valley', 205, 'alley'),('Through the middle of my skull', 205, 'ull'),('At night I wake up with the sheets soaking wet', 205, 'et'),('And a freight train running through the middle of my head', 205, 'ead'),('Only you can cool my desire', 205, 'esire'),('Oh oh oh, I''m on fire', 205, 'ire'),('Oh oh oh, I''m on fire', 205, 'ire'),('Oh oh oh, I''m on fire', 205, 'ire'),('Woo ooh ooh', 205, 'ooh'),('Woo ooh ooh', 205, 'ooh'),('Ooh ooh ooh', 205, 'ooh'),('Woo ooh ooh', 205, 'ooh'),('Woo ooh ooh', 205, 'ooh'), ('Well, we busted out of class', 206, 'ass'),('Had to get away from those fools', 206, 'ools'),('We learned more from a three-minute record, baby', 206, 'aby'),('Than we ever learned in school', 206, 'ool'),('Tonight I hear the neighborhood drummer sound', 206, 'ound'),('I can feel my heart begin to pound', 206, 'ound'),('You say you''re tired and you just want to close your eyes', 206, 'eyes'),('And follow your dreams down', 206, 'own'),('Well, we made a promise we swore we''d always remember', 206, 'emember'),('No retreat, baby, no surrender', 206, 'urrender'),('Like soldiers in the winter''s night with a vow to defend', 206, 'efend'),('No retreat, baby, no surrender', 206, 'urrender'),('Well, now young faces grow sad and old', 206, 'old'),('And hearts of fire grow cold', 206, 'old'),('We swore blood brothers against the wind', 206, 'ind'),('Now I''m ready to grow young again', 206, 'again'),('And hear your sister''s voice calling us home', 206, 'ome'),('Across the open yards', 206, 'yards'),('Well maybe we''ll cut someplace of our own', 206, 'own'),('With these drums and these guitars', 206, 'uitars'),('''Cause we made a promise we swore we''d always remember', 206, 'emember'),('No retreat, baby, no surrender', 206, 'urrender'),('Blood brothers in the stormy night with a vow to defend', 206, 'efend'),('No retreat, baby, no surrender', 206, 'urrender'),('Now on the street tonight the lights grow dim', 206, 'im'),('The walls of my room are closing in', 206, 'in'),('There''s a war outside still raging', 206, 'aging'),('You say it ain''t ours anymore to win', 206, 'in'),('I want to sleep beneath', 206, 'eneath'),('Peaceful skies in my lover''s bed', 206, 'ed'),('With a wide open country in my eyes', 206, 'eyes'),('And these romantic dreams in my head', 206, 'ead'),('Once we made a promise we swore we''d always remember', 206, 'emember'),('No retreat, baby, no surrender', 206, 'urrender'),('Blood brothers in a stormy night with a vow to defend', 206, 'efend'),('No retreat, baby, no surrender', 206, 'urrender'),('No retreat, baby, no surrender', 206, 'urrender'), ('Well I came by your house the other day', 207, 'ay'),('Your mother said you went away', 207, 'away'),('She said there was nothing that I could have done', 207, 'one'),('There was nothing nobody could say', 207, 'ay'),('Now me and you we''ve known each other', 207, 'other'),('Ever since we were sixteen', 207, 'ixteen'),('I wished I would have known', 207, 'own'),('I wished I could have called you', 207, 'you'),('Just to say goodbye', 207, 'oodbye'),('Bobby Jean', 207, 'ean'),('Now you hung with me when all the others', 207, 'others'),('Turned away turned up their nose', 207, 'ose'),('We like the same music we like the same bands', 207, 'ands'),('We like the same clothes', 207, 'othes'),('We told each other that we were the wildest', 207, 'ildest'),('The wildest things we''d ever seen', 207, 'een'),('Now I wished I could have talked to you', 207, 'you'),('Just to say goodbye Bobby Jean', 207, 'ean'),('Now we went walking in the rain talking about the pain', 207, 'ain'),('From the world we hid', 207, 'id'),('Now there ain''t nobody nowhere nohow gonna ever understand me', 207, 'e'),('They way you did', 207, 'id'),('Maybe you''ll be out there on that road somewhere', 207, 'omewhere'),('In some bus or train traveling along', 207, 'along'),('In some motel room there''ll be a radio playing', 207, 'aying'),('And you''ll hear me sing this song', 207, 'ong'),('Well if you do you''ll know I''m thinking of you', 207, 'you'),('And all the miles in between', 207, 'etween'),('And I''m just calling one last time', 207, 'ime'),('Not to change your mind', 207, 'ind'),('But just to say I miss you baby', 207, 'aby'),('Good luck, goodbye', 207, 'oodbye'),('Bobby Jean', 207, 'ean'), ('We sit in the car outside your house', 208, 'ouse'),('I can feel the heat coming ''round', 208, 'ound'),('I go to put my arm around you', 208, 'you'),('And you give me a look like I''m way out of bounds', 208, 'ounds'),('Well you let out one of your bored sighs', 208, 'ighs'),('Well lately when I look into your eyes', 208, 'eyes'),('I''m goin down, down, down, down', 208, 'own'),('I''m goin down, down, down, down', 208, 'own'),('I''m goin down, down, down, down', 208, 'own'),('I''m goin down, down, down, down', 208, 'own'),('We get dressed up and we go out, baby, for the night', 208, 'ight'),('We come home early burning, burning, burning in some firefight', 208, 'irefight'),('I''m sick and tired of you setting me up yeah', 208, 'yeah'),('Setting me up just to knock-a knock-a knock-a me down, down, down, down', 208, 'own'),('I''m goin down, down, down, down', 208, 'own'),('I''m goin down, down, down, down', 208, 'own'),('I''m goin down, down, down, down, hey now', 208, 'ow'),('I pull you close now baby', 208, 'aby'),('But when we kiss I can feel a doubt', 208, 'oubt'),('I remember back when we started', 208, 'arted'),('My kisses used to turn you inside out', 208, 'out'),('I used to drive you to work in the morning', 208, 'orning'),('Friday night I''d drive you all around', 208, 'around'),('You used to love to drive me wild yeah', 208, 'yeah'),('But lately girl you get your kicks from just driving me down, down, down, down', 208, 'own'),('I''m goin down, down, down, down', 208, 'own'),('I''m goin down, down, down, down', 208, 'own'),('I''m goin down, down, down, down', 208, 'own'),('I''m goin down, down, down, down', 208, 'own'),('I''m goin down, down, down, down', 208, 'own'),('I''m goin down, down, down, down', 208, 'own'),('I''m goin down, hey bopa d-d-down', 208, 'own'),('I''m goin down, down, down, down', 208, 'own'),('I''m goin down, hey bopa d-d-down', 208, 'own'),('I''m goin down, down, down, yeah', 208, 'yeah'),('I''m goin down, down, hey bopa hey bopa', 208, 'opa'),('Hey hey mmm bopa bopa well down', 208, 'own'),('Hey babe mmm bopa bopa said down', 208, 'own'),('Hey hey mmm bopa bopa well down', 208, 'own'),('Hey hey mmm bopa bopa say', 208, 'ay'),('Hey unh say down, down, down, down, down', 208, 'own'),('Hey down now, say down, down, down, down, down', 208, 'own'), ('I had a friend was a big baseball player back in high school', 209, 'ool'),('he could throw that speedball by you', 209, 'you'),('Make you look like a fool', 209, 'ool'),('Saw him the other night at this roadside bar I was walking in', 209, 'in'),('And he was walking out', 209, 'out'),('We went back inside sat down', 209, 'own'),('Had a few drinks but all he kept talking about was', 209, 'as'),('Glory days well they''ll pass you by', 209, 'y'),('Glory days in the wink of a young girl''s eye', 209, 'eye'),('Glory days, glory days', 209, 'ays'),('There''s a girl that lives up the block', 209, 'ock'),('back in school', 209, 'ool'),('She could turn all the boys'' heads', 209, 'eads'),('Sometimes on a Friday I''ll stop by and have a few drinks', 209, 'inks'),('After she put her kids to bed', 209, 'ed'),('Her and her husband Bobby well they split up', 209, 'up'),('I guess it''s two years gone by now', 209, 'ow'),('We just sit around talking about the old times, she says', 209, 'ays'),('when she feels like crying she starts laughing thinking about', 209, 'about'),('Glory days well they''ll pass you by', 209, 'y'),('Glory days in the wink of a young girl''s eye', 209, 'eye'),('Glory days', 209, 'ays'),('Glory days', 209, 'ays'),('Think I''m going down to the well tonight', 209, 'onight'),('And I''m going to drink till I get my fill', 209, 'ill'),('And I hope when I get old I don''t sit around thinking about it', 209, 'it'),('But I probably will', 209, 'ill'),('Yeah just sitting back trying to recapture a little of the glory of', 209, 'of'),('But time slips away and leaves you with nothing mister', 209, 'ister'),('But boring old stories of glory days', 209, 'ays'),('Glory days well they''ll pass you by', 209, 'y'),('Glory days in the wink of a young girl''s eye', 209, 'eye'),('Glory days, glory days', 209, 'ays'), ('I get up in the evening', 210, 'evening'),('And I ain''t got nothing to say', 210, 'ay'),('I come home in the morning', 210, 'orning'),('I go to bed feeling the same way', 210, 'ay'),('I ain''t got nothing but tired', 210, 'ired'),('Man I''m just tired and bored with myself', 210, 'yself'),('Hey there baby I could use just a little help', 210, 'elp'),('You can''t start a fire', 210, 'ire'),('You can''t start a fire without a spark', 210, 'ark'),('This gun''s for hire', 210, 'ire'),('Even if we''re just dancing in the dark', 210, 'ark'),('Message keeps getting clearer', 210, 'earer'),('Radio''s on and I''m moving ''round the place', 210, 'ace'),('I check my look in the mirror', 210, 'irror'),('I wanna change my clothes, my hair, my face', 210, 'ace'),('Man I ain''t getting nowhere just living in a dump like this', 210, 'is'),('There''s something happening somewhere', 210, 'omewhere'),('Baby I just know that there is', 210, 'is'),('You can''t start a fire', 210, 'ire'),('You can''t start a fire without a spark', 210, 'ark'),('This gun''s for hire', 210, 'ire'),('Even if we''re just dancing in the dark', 210, 'ark'),('You sit around getting older', 210, 'older'),('There''s a joke here somewhere and it''s on me', 210, 'e'),('I''ll shake this world off my shoulders', 210, 'oulders'),('Come on now baby the laugh''s on me', 210, 'e'),('Stay on the streets of this town', 210, 'own'),('And they''ll be carving you up all right', 210, 'ight'),('They say you gotta stay hungry', 210, 'ungry'),('Hey baby I''m just about starving tonight', 210, 'onight'),('I''m dying for some action', 210, 'action'),('I''m sick of sitting ''round here trying to write this book', 210, 'ook'),('I need a love reaction', 210, 'eaction'),('Come on now baby gimme just one look', 210, 'ook'),('You can''t start a fire', 210, 'ire'),('Sitting ''round crying over a broken heart', 210, 'eart'),('This gun''s for hire', 210, 'ire'),('Even if we''re just dancing in the dark', 210, 'ark'),('You can''t start a fire', 210, 'ire'),('Worrying about your little world falling apart', 210, 'apart'),('This gun''s for hire', 210, 'ire'),('Even if we''re just dancing in the dark', 210, 'ark'), ('I was eight years old and running with a dime in my hand', 211, 'and'),('To the bus stop to pick up a paper for my old man', 211, 'an'),('I''d sit on his lap', 211, 'ap'),('In that big old Buick', 211, 'uick'),('And steer as we drove through town', 211, 'own'),('He''d tousle my hair', 211, 'air'),('And say son take a good look around', 211, 'around'),('This is your hometown', 211, 'ometown'),('This is your hometown', 211, 'ometown'),('This is your hometown', 211, 'ometown'),('This is your hometown', 211, 'ometown'),('In ''65 tension was running high at my high school', 211, 'ool'),('There was a lot of fights between the black and white', 211, 'ite'),('There was nothing you could do', 211, 'o'),('Two cars at a light', 211, 'ight'),('On a Saturday night', 211, 'ight'),('In the back seat there was a gun', 211, 'un'),('Words were passed', 211, 'assed'),('In a shotgun blast', 211, 'ast'),('Troubled times had come to my hometown', 211, 'ometown'),('My hometown', 211, 'ometown'),('My hometown', 211, 'ometown'),('My hometown', 211, 'ometown'),('Now Main Street''s whitewashed windows and vacant stores', 211, 'ores'),('Seems like there ain''t nobody wants to come down here no more', 211, 'ore'),('They''re closing down the textile mill across the railroad tracks', 211, 'acks'),('Foreman says these jobs are going boys and they ain''t coming back', 211, 'ack'),('To your hometown', 211, 'ometown'),('Your hometown', 211, 'ometown'),('Your hometown', 211, 'ometown'),('Your hometown', 211, 'ometown'),('Last night me and Kate we laid in bed', 211, 'ed'),('Talking about getting out', 211, 'out'),('Packing up our bags maybe heading south', 211, 'outh'),('I''m thirty-five, we got a boy of our own now', 211, 'ow'),('Last night I sat him up behind the wheel', 211, 'eel'),('And said son take a good look around', 211, 'around'),('This is your hometown', 211, 'ometown');

insert into lyrics_fragments ("fragment_text", "song_id", "rhyme") values ('You been hurt and you''re all cried out you say', 100, 'ay'),('You walk down the street pushin'' people outta your way', 100, 'ay'),('You packed your bags and all alone you wanna ride,', 100, 'ide,'),('You don''t want nothin'', don''t need no one by your side', 100, 'ide'),('You''re walkin'' tough baby, but you''re walkin'' blind', 100, 'ind'),('The ties that bind', 100, 'ind'),('Now you can''t break the ties that bind', 100, 'ind'),('Cheap romance, it''s all just a crutch', 100, 'utch'),('You don''t want nothin'' that anybody can touch', 100, 'ouch'),('You''re so afraid of being somebody''s fool', 100, 'ool'),('Not walkin'' tough baby, not walkin'' cool', 100, 'ool'),('You walk cool, but darlin'', can you walk the line', 100, 'ine'),('And face the ties that bind', 100, 'ind'),('The ties that bind', 100, 'ind'),('Now you can''t break the ties that bind', 100, 'ind'),('I would rather feel the hurt inside, yes I would darlin'',', 100, 'arlin'','),('Than know the emptiness your heart must hide,', 100, 'ide,'),('Yes I would darlin'', yes I would darlin'',', 100, 'arlin'','),('Yes I would baby', 100, 'aby'),('You sit and wonder just who''s gonna stop the rain', 100, 'ain'),('Who''ll ease the sadness, who''s gonna quiet the pain', 100, 'ain'),('It''s a long dark highway and a thin white line', 100, 'ine'),('Connecting baby, your heart to mine', 100, 'ine'),('We''re runnin'' now but darlin'' we will stand in time', 100, 'ime'),('To face the ties that bind', 100, 'ind'),('The ties that bind', 100, 'ind'),('Now you can''t break the ties that bind', 100, 'ind'),('You can''t forsake the ties that bind', 100, 'ind'), ('Your mama''s yappin'' in the back seat', 101, 'eat'),('Tell her to push over and move them big feet', 101, 'eet'),('Every Monday morning I gotta drive her down to the unemployment agency', 101, 'agency'),('Well this morning I ain''t fighting, tell her I give up', 101, 'up'),('Tell her she wins if she''ll just shut up', 101, 'up'),('But it''s the last time that she''s gonna be ridin'' with me', 101, 'e'),('And you can tell her there''s a hot sun beatin'' on the blacktop', 101, 'acktop'),('She keeps talkin'', she''ll be walkin'' that last block', 101, 'ock'),('She can take a subway back to the ghetto tonight', 101, 'onight'),('Well I got some beer and the highway''s free', 101, 'ee'),('And I got you, and baby you''ve got me', 101, 'e'),('Hey hey hey, whataya say, Sherry Darlin''', 101, 'arlin'''),('Now there''s girls melting on the beach', 101, 'each'),('And they''re so fine but so out of reach', 101, 'each'),('Cause I''m stuck in traffic down here on 53rd street', 101, 'eet'),('Now Sherry my love for you is real', 101, 'eal'),('But I didn''t count on this package deal', 101, 'eal'),('And baby this car just ain''t big enough for her and me', 101, 'e'),('Well let there be sunlight, let there be rain', 101, 'ain'),('Let the brokenhearted love again', 101, 'again'),('Sherry we can run with our arms open wide before the tide', 101, 'ide'),('To all the girls down at Sacred Heart', 101, 'eart'),('And all you operators back in the Park', 101, 'ark'),('Say hey hey hey, whataya say, Sherry Darlin''', 101, 'arlin'''),('Say hey hey hey, whataya say, Sherry Darlin''', 101, 'arlin'''),('Say hey hey hey, whataya say, Sherry Darlin''', 101, 'arlin'''), ('Driving home she grabs something to eat', 102, 'eat'),('Turns a corner and drives down her street', 102, 'eet'),('Into a row of houses she just melts away', 102, 'away'),('Like the scenery in another man''s play', 102, 'ay'),('Into a house where the blinds are closed', 102, 'osed'),('To keep from seeing things she don''t wanna know', 102, 'ow'),('She pulls the blinds and looks out on the street', 102, 'eet'),('The cool of the night takes the edge off the heat', 102, 'eat'),('In the Jackson Cage', 102, 'age'),('Down in the Jackson Cage', 102, 'age'),('You can try with all your might', 102, 'ight'),('But you''re reminded every night', 102, 'ight'),('That you been judged and handed life', 102, 'ife'),('Down in the Jackson Cage', 102, 'age'),('Every day ends in wasted motion', 102, 'otion'),('Just crossed swords on the killing floor', 102, 'oor'),('To settle back is to settle without knowing', 102, 'owing'),('The hard edge that you''re settling for', 102, 'or'),('Because there''s always just one more day', 102, 'ay'),('And it''s always gonna be that way', 102, 'ay'),('Little girl you''ve been down here so long', 102, 'ong'),('I can tell by the way that you move you belong to', 102, 'o'),('The Jackson Cage', 102, 'age'),('Down in Jackson Cage', 102, 'age'),('And it don''t matter just what you say', 102, 'ay'),('Are you tough enough to play the game they play', 102, 'ay'),('Or will you just do your time and fade away', 102, 'away'),('Down into the Jackson Cage', 102, 'age'),('Baby there''s nights when I dream of a better world', 102, 'orld'),('But I wake up so downhearted girl', 102, 'irl'),('I see you feeling so tired and confused', 102, 'onfused'),('I wonder what it''s worth to me or you', 102, 'ou'),('Just waiting to see some sun', 102, 'un'),('Never knowing if that day will ever come', 102, 'ome'),('Left alone standing out on the street', 102, 'eet'),('Till you become the hand that turns the key down in', 102, 'in'),('Jackson Cage', 102, 'age'),('Down in Jackson Cage', 102, 'age'),('Well darlin'' can you understand', 102, 'understand'),('The way that they will turn a man', 102, 'an'),('Into a stranger to waste away', 102, 'away'),('Down in the Jackson Cage', 102, 'age'), ('I went out walking the other day', 103, 'ay'),('Seen a little girl crying along the way', 103, 'ay'),('She''d been hurt so bad said she''d never love again', 103, 'again'),('Someday your crying girl will end', 103, 'end'),('And you''ll find once again', 103, 'again'),('Two hearts are better than one', 103, 'one'),('Two hearts girl get the job done', 103, 'one'),('Two hearts are better than one', 103, 'one'),('Once I spent my time playing tough guy scenes', 103, 'enes'),('But I was living in a world of childish dreams', 103, 'eams'),('Someday these childish dreams must end', 103, 'end'),('To become a man and grow up to dream again', 103, 'again'),('Now I believe in the end', 103, 'end'),('Two hearts are better than one...', 103, 'one...'),('Sometimes it might seem like it was planned', 103, 'anned'),('For you to roam empty hearted through this land', 103, 'and'),('Though the world turns you hard and cold', 103, 'old'),('There''s one thing mister that I know', 103, 'ow'),('That''s if you think your heart is stone', 103, 'one'),('And that you''re rough enough to whip this world alone', 103, 'alone'),('Alone buddy there ain''t no peace of mind', 103, 'ind'),('That''s why I''ll keep searching till I find my special one', 103, 'one'),('Two hearts are better than one...', 103, 'one...'), ('Well Papa go to bed now it''s getting late', 104, 'ate'),('Nothing we can say is gonna change anything now', 104, 'ow'),('I''ll be leaving in the morning from St. Mary''s Gate', 104, 'ate'),('We wouldn''t change this thing even if we could somehow', 104, 'omehow'),('''Cause the darkness of this house has got the best of us', 104, 'us'),('There''s a darkness in this town that''s got us too', 104, 'oo'),('But they can''t touch me now and you can''t touch me now', 104, 'ow'),('They ain''t gonna do to me what I watched them do to you', 104, 'ou'),('So say goodbye it''s Independence Day', 104, 'ay'),('It''s Independence Day all down the line', 104, 'ine'),('Just say goodbye it''s Independence Day', 104, 'ay'),('It''s Independence Day this time', 104, 'ime'),('Now I don''t know what it always was with us', 104, 'us'),('We chose the words and yeah we drew the lines', 104, 'ines'),('There was just no way this house could hold the two of us', 104, 'us'),('I guess that we were just too much of the same kind', 104, 'ind'),('Well say goodbye it''s Independence Day', 104, 'ay'),('All boys must run away come Independence Day', 104, 'ay'),('So say goodbye it''s Independence Day', 104, 'ay'),('All men must make their way come Independence Day', 104, 'ay'),('Now the rooms are all empty down at Frankie''s joint', 104, 'oint'),('And the highway she''s deserted down to Breaker''s Point', 104, 'oint'),('There''s a lot of people leaving town now', 104, 'ow'),('Leaving their friends their homes', 104, 'omes'),('At night they walk that dark and dusty highway all alone', 104, 'alone'),('Well Papa go to bed now it''s getting late', 104, 'ate'),('Nothing we can say can change anything now', 104, 'ow'),('Because there''s just different people coming down here now', 104, 'ow'),('And they see things in different ways', 104, 'ays'),('And soon everything we''ve known will just be swept away', 104, 'away'),('So say goodbye it''s Independence Day', 104, 'ay'),('Papa now I know the things you wanted that you could not say', 104, 'ay'),('But won''t you just say goodbye it''s Independence Day', 104, 'ay'),('I swear I never meant to take those things away', 104, 'away'), ('Got a wife and kids in Baltimore Jack', 105, 'ack'),('I went out for a ride and I never went back', 105, 'ack'),('Like a river that don''t know where it''s flowing', 105, 'owing'),('I took a wrong turn and I just kept going', 105, 'oing'),('Everybody''s got a hungry heart', 105, 'eart'),('Everybody''s got a hungry heart', 105, 'eart'),('Lay down your money and you play your part', 105, 'art'),('Everybody''s got a hungry heart', 105, 'eart'),('I met her in a Kingstown bar', 105, 'ar'),('We fell in love I knew it had to end', 105, 'end'),('We took what we had and we ripped it apart', 105, 'apart'),('Now here I am down in Kingstown again', 105, 'again'),('Everybody''s got a hungry heart...', 105, 'eart...'),('Everybody needs a place to rest', 105, 'est'),('Everybody wants to have a home', 105, 'ome'),('Don''t make no difference what nobody says', 105, 'ays'),('Ain''t nobody like to be alone', 105, 'alone'),('Everybody''s got a hungry heart...', 105, 'eart...'), ('Put on your best dress baby', 106, 'aby'),('And darlin'', fix your hair up right', 106, 'ight'),('Cause there''s a party, honey', 106, 'oney'),('Way down beneath the neon lights', 106, 'ights'),('All day you''ve been working that hard line', 106, 'ine'),('Now tonight you''re gonna have a good time', 106, 'ime'),('I work five days a week girl', 106, 'irl'),('Loading crates down on the dock', 106, 'ock'),('I take my hard earned money', 106, 'oney'),('And meet my girl down on the block', 106, 'ock'),('And Monday when the foreman calls time', 106, 'ime'),('I''ve already got Friday on my mind', 106, 'ind'),('When that whistle blows', 106, 'ows'),('Girl, I''m down the street', 106, 'eet'),('I''m home, I''m out of my work clothes', 106, 'othes'),('When I''m out in the street', 106, 'eet'),('I walk the way I wanna walk', 106, 'alk'),('When I''m out in the street', 106, 'eet'),('I talk the way I wanna talk', 106, 'alk'),('When I''m out in the street', 106, 'eet'),('When I''m out in the street', 106, 'eet'),('When I''m out in the street, girl', 106, 'irl'),('Well, I never feel alone', 106, 'alone'),('When I''m out in the street, girl', 106, 'irl'),('In the crowd I feel at home', 106, 'ome'),('The black and whites they cruise by', 106, 'by'),('And they watch us from the corner of their eye', 106, 'eye'),('But there ain''t no doubt girl, down here', 106, 'ere'),('We ain''t gonna take what they''re handing out', 106, 'out'),('When I''m out in the street', 106, 'eet'),('I walk the way I wanna walk', 106, 'alk'),('When I''m out in the street', 106, 'eet'),('I talk the way I wanna talk', 106, 'alk'),('Baby, out in the street I don''t feel sad or blue', 106, 'ue'),('Baby, out in the street I''ll be waiting for you', 106, 'ou'),('When the whistle blows', 106, 'ows'),('Girl, I''m down the street', 106, 'eet'),('I''m home, I''m out of my work clothes', 106, 'othes'),('When I''m out in the street', 106, 'eet'),('I walk the way I wanna walk', 106, 'alk'),('When I''m out in the street', 106, 'eet'),('I talk the way I wanna talk', 106, 'alk'),('When I''m out in the street', 106, 'eet'),('Pretty girls, they''re all passing by', 106, 'by'),('When I''m out in the street', 106, 'eet'),('From the corner, we give them the eye', 106, 'eye'),('Baby, out in the street I just feel all right', 106, 'ight'),('Meet me out in the street, little girl, tonight', 106, 'ight'),('Meet me out in the street', 106, 'eet'),('Meet me out in the street', 106, 'eet'), ('My feets were flyin'' down the street just the other night', 107, 'ight'),('When a Hong Kong special pulled up at the light', 107, 'ight'),('What was inside, man, was just c''est magnifique', 107, 'agnifique'),('I wanted to hold the bumper and let her drag me down the street', 107, 'eet'),('Ooh, ooh, I gotta crush on you', 107, 'ou'),('Ooh, ooh, I gotta crush on you', 107, 'ou'),('Ooh, ooh, I gotta crush on you tonight', 107, 'onight'),('Sometimes I spot a little stranger standing ''cross the room', 107, 'oom'),('My brain takes a vacation just to give my heart more room', 107, 'oom'),('For one kiss, darling I swear everything I would give', 107, 'ive'),('Cause you''re a walking, talking reason to live', 107, 'ive'),('Well now she might be the talk of high society', 107, 'ociety'),('She''s probably got a lousy personality', 107, 'ersonality'),('She might be a heiress to Rockefeller', 107, 'ockefeller'),('She might be a waitress or a bank teller', 107, 'eller'),('She makes the Venus de Milo look like she''s got no style', 107, 'e'),('She make Sheena of the Jungle look meek and mild', 107, 'ild'),('I need a quick shot, Doc, knock me off my feet', 107, 'eet'),('Cause I''ll be minding my own business walking down the street... watchout!', 107, 'atchout!'), ('Yesterday I went shopping buddy down to the mall', 108, 'all'),('Looking for something pretty I could hang on my wall', 108, 'all'),('I knocked over a lamp before it hit the floor I caught it', 108, 'it'),('A salesman turned around said ''Boy you break that thing you bought it''', 108, 'it'''),('You can look but you better not touch boy', 108, 'oy'),('You can look but you better not touch', 108, 'ouch'),('Mess around and you''ll end up in dutch boy', 108, 'oy'),('You can look but you better not no you better not no you better not touch', 108, 'ouch'),('Well I came home from work and I switched on channel 5', 108, '5'),('There was a pretty little girly lookin'' straight into my eyes', 108, 'eyes'),('Well I watched as she wiggled back and forth across the screen', 108, 'een'),('She didn''t get me excited she just made me feel mean', 108, 'ean'),('You can look...', 108, 'ook'),('Well I called up Dirty Annie on the telephone', 108, 'elephone'),('I took her out to the drive-in just to get her alone', 108, 'alone'),('I found a lover''s rendezvous the music low set to park', 108, 'ark'),('I heard a tappin'' on the window and a voice in the dark', 108, 'ark'),('You can look...', 108, 'ook'), ('I see you walking, baby, down the street', 109, 'eet'),('Pushing that baby carriage at your feet', 109, 'eet'),('I see the lonely ribbon in your hair', 109, 'air'),('Tell me I am the man for whom you put it there', 109, 'ere'),('You never smile girl, you never speak', 109, 'eak'),('You just walk on by, darlin'' week after week', 109, 'eek'),('Raising two kids alone in this mixed up world', 109, 'orld'),('Must be a lonely life for a working girl', 109, 'irl'),('Little girl, I wanna marry you', 109, 'ou'),('Oh yeah, little girl, I wanna marry you', 109, 'ou'),('Yes I do', 109, 'o'),('Little girl, I wanna marry you', 109, 'ou'),('Now honey, I don''t wanna clip your wings', 109, 'ings'),('But a time comes when two people should think of these things', 109, 'ings'),('Having a home and a family', 109, 'amily'),('Facing up to their responsibilities', 109, 'esponsibilities'),('They say in the end true love prevails', 109, 'evails'),('But in the end true love can''t be no fairytale', 109, 'airytale'),('To say I''ll make your dreams come true would be wrong', 109, 'ong'),('But maybe, darlin'', I could help them along', 109, 'along'),('My daddy said right before he died', 109, 'ied'),('That true, true love was just a lie', 109, 'ie'),('He went to his grave a broken heart', 109, 'eart'),('An unfulfilled life, makes a man hard', 109, 'ard'),('Oh, darlin''', 109, 'arlin'''),('There''s something happy and there''s something sad', 109, 'ad'),('''Bout wanting somebody, oh so bad,', 109, 'ad,'),('I wear my love darlin'', without shame', 109, 'ame'),('I''d be proud if you would wear my name', 109, 'ame'), ('I come from down in the valley where mister when you''re young', 110, 'oung'),('They bring you up to do like your daddy done', 110, 'one'),('Me and Mary we met in high school when she was just seventeen', 110, 'eventeen'),('We''d ride out of that valley down to where the fields were green', 110, 'een'),('We''d go down to the river', 110, 'iver'),('And into the river we''d dive', 110, 'ive'),('Oh down to the river we''d ride', 110, 'ide'),('Then I got Mary pregnant and man that was all she wrote', 110, 'ote'),('And for my nineteenth birthday I got a union card and a wedding coat', 110, 'oat'),('We went down to the courthouse and the judge put it all to rest', 110, 'est'),('No wedding day smiles, no walk down the aisle,', 110, 'aisle,'),('No flowers, no wedding dress', 110, 'ess'),('That night we went down to the river', 110, 'iver'),('And into the river we''d dive', 110, 'ive'),('Oh down to the river we did ride', 110, 'ide'),('I got a job working construction for the Johnstown Company', 110, 'ompany'),('But lately there ain''t been much work on account of the economy', 110, 'economy'),('Now all them things that seemed so important', 110, 'important'),('Well mister they vanished right into the air', 110, 'air'),('Now I just act like I don''t remember, Mary acts like she don''t care', 110, 'are'),('But I remember us riding in my brother''s car', 110, 'ar'),('Her body tan and wet down at the reservoir', 110, 'eservoir'),('At night on them banks I''d lie awake', 110, 'awake'),('And pull her close just to feel each breath she''d take', 110, 'ake'),('Now those memories come back to haunt me, they haunt me like a curse', 110, 'urse'),('Is a dream a lie if it don''t come true', 110, 'ue'),('Or is it something worse that sends me', 110, 'e'),('Down to the river though I know the river is dry', 110, 'dry'),('Down to the river, my baby and I', 110, 'I'),('Oh down to the river we ride', 110, 'ide'), ('Do you still say your prayers little darlin'' do you go to bed at night', 111, 'ight'),('Prayin'' that tomorrow, everything will be alright', 111, 'alright'),('But tommorow''s fall in number in number one by one', 111, 'one'),('You wake up and you''re dying you don''t even know what from', 111, 'om'),('Well they shot you point blank you been shot in the back', 111, 'ack'),('Baby point blank you been fooled this time little girl that''s a fact', 111, 'act'),('Right between the eyes baby, point blank right between the pretty lies that they tell', 111, 'ell'),('Little girl you fell', 111, 'ell'),('You grew up where young girls they grow up fast', 111, 'ast'),('You took what you were handed and left behind what was asked', 111, 'asked'),('but what they asked baby wasn''t right', 111, 'ight'),('you didn''t have to live that life,', 111, 'ife,'),('I was gonna be your Romeo you were gonna be my Juliet', 111, 'uliet'),('These days you don''t wait on Romeos you wait on that welfare check', 111, 'eck'),('and on all the pretty things that you can''t ever have and on all the promises', 111, 'omises'),('That always end up point blank, shot between the eyes', 111, 'eyes'),('Point blank like little white lies you tell to ease the pain', 111, 'ain'),('You''re walkin'' in the sights, girl of point blank', 111, 'ank'),('and it''s one false move and baby the lights go out', 111, 'out'),('Once I dreamed we were together again baby you and me', 111, 'e'),('Back home in those old clubs the way we used to be', 111, 'e'),('We were standin'' at the bar it was hard to hear', 111, 'ear'),('The band was playin'' loud and you were shoutin'' somethin'' in my ear', 111, 'ear'),('You pulled my jacket off and as the drummer counted four', 111, 'our'),('You grabbed my hand and pulled me out on the floor', 111, 'oor'),('You just stood there and held me, then you started dancin'' slow', 111, 'ow'),('And as I pulled you tighter I swore I''d never let you go', 111, 'o'),('Well I saw you last night down on the avenue', 111, 'avenue'),('Your face was in the shadows but I knew that it was you', 111, 'ou'),('You were standin'' in the doorway out of the rain', 111, 'ain'),('You didn''t answer when I called out your name', 111, 'ame'),('You just turned, and then you looked away', 111, 'away'),('like just another stranger waitin'' to get blown away', 111, 'away'),('Point blank, right between the eyes', 111, 'eyes'),('Point blank, right between the pretty lies you fell', 111, 'ell'),('Point blank, shot right through the heart', 111, 'eart'),('Yea point blank, you''ve been twisted up till you''ve become just another part of it', 111, 'it'),('Point blank, you''re walkin'' in the sights', 111, 'ights'),('Point blank, livin'' one false move just one false move away', 111, 'away'),('Point blank, they caught you in their sights', 111, 'ights'),('Point blank, did you forget how to love,', 111, 'ove,'),('girl, did you forget how to fight.', 111, 'ight.'),('Point blank they must have shot you in the head', 111, 'ead'),('Cause point blank, bang bang baby you''re dead.', 111, 'ead.'), ('Well there she sits buddy just a-gleaming in the sun', 112, 'un'),('There to greet a working man when his day is done', 112, 'one'),('I''m gonna pack my pa and I''m gonna pack my aunt', 112, 'aunt'),('I''m gonna take them down to the Cadillac Ranch', 112, 'anch'),('El Dorado fins, whitewalls and skirts', 112, 'irts'),('Rides just like a little bit of heaven here on earth', 112, 'earth'),('Well buddy when I die throw my body in the back', 112, 'ack'),('And drive me to the junkyard in my Cadillac', 112, 'adillac'),('Cadillac, Cadillac', 112, 'adillac'),('Long and dark, shiny and black', 112, 'ack'),('Open up your engines, let ''em roar', 112, 'oar'),('Tearing up the highway like a big old dinosaur', 112, 'inosaur'),('James Dean in that Mercury fortynine', 112, 'ortynine'),('Junior Johnson runnin'' through the woods of Caroline', 112, 'aroline'),('Even Burt Reynolds in that black Trans Am', 112, 'am'),('All gonna meet down at the Cadillac Ranch', 112, 'anch'),('Hey little girlie in the blue jeans so tight', 112, 'ight'),('Drivin'' alone through the Wisconsin night', 112, 'ight'),('You''re my last love, baby you''re my last chance', 112, 'ance'),('Don''t let ''em take me to the Cadillac Ranch', 112, 'anch'),('Pulled up to my house today', 112, 'oday'),('Came and took my little girl away', 112, 'away'), ('I got a 007 watch and it''s a one and only', 113, 'only'),('It''s got a I-Spy beeper that tells me when you''re lonely', 113, 'onely'),('I got a Batmobile so I can reach ya'' in a fast shake', 113, 'ake'),('When your world''s in crisis of an impendin'' heartbreak', 113, 'eartbreak'),('Now don''t you call James Bond or Secret Agent Man', 113, 'an'),('Cause they can''t do it, like I can', 113, 'an'),('I''m a rocker, baby, I''m a rocker - every day', 113, 'ay'),('I''m a rocker, baby, I''m a rocker', 113, 'ocker'),('If you''re hanging from a cliff or you''re tied to the tracks, girl', 113, 'irl'),('Columbo split and you can''t find Kojak', 113, 'ojak'),('True love is broken and your tears are fallin'' faster', 113, 'aster'),('You''re sufferin'' from a pain in your heart or some other natural disaster', 113, 'isaster'),('Now I don''t care what kind of shape you''re in', 113, 'in'),('If they put up a roadblock, I''ll parachute in', 113, 'in'),('I''m a rocker, baby, I''m a rocker - I''m in love', 113, 'ove'),('I''m a rocker, baby, I''m a rocker - every day', 113, 'ay'),('I''m a rocker, baby, I''m a rocker - with you', 113, 'ou'),('So you fell for some jerk who was tall, dark and handsome', 113, 'andsome'),('Then he kidnapped your heart and now he''s holdin'' it for ransom', 113, 'ansom'),('Well, like a mission impossible I''m gonna go and get it back', 113, 'ack'),('You know I would''a taken better care of it, baby, than that', 113, 'at'),('Sometimes I get so hot girl, well, I can''t talk', 113, 'alk'),('But when I''m with you I cool off, and I walk', 113, 'alk'),('I''m a rocker, baby, I''m a rocker, and I talk', 113, 'alk'),('I''m a rocker, baby, I''m a rocker, every day', 113, 'ay'),('I''m a rocker, baby, I''m a rocker, every day', 113, 'ay'), ('Well now you say you''ve found another man who does things to you that I can''t', 114, 'an''t'),('And that no matter what I do it''s all over now between me and you girl', 114, 'irl'),('But I can''t believe what you say', 114, 'ay'),('No I can''t believe what you say', 114, 'ay'),('''cause baby', 114, 'aby'),('I don''t wanna fade away', 114, 'away'),('Oh I don''t wanna fade away', 114, 'away'),('Tell me what can I do what can I say', 114, 'ay'),('Cause darlin'' I don''t wanna fade away', 114, 'away'),('Well now you say that you''ve made up your mind', 114, 'ind'),('it''s been such a long, long time since it''s been good with us', 114, 'us'),('And that somewhere back along the line you lost your love and I lost your trust', 114, 'ust'),('Now rooms that once were so bright are filled with the coming night, darlin''', 114, 'arlin'''),('You say it''s not easy for you', 114, 'ou'),('And that you''ve been so lonely', 114, 'onely'),('While other girls go out doing what they want to do', 114, 'o'),('You say that you miss the nights when we''d go out dancing', 114, 'ancing'),('The days when you and I walked as two', 114, 'o'),('Well girl I miss them too', 114, 'oo'),('Oh I swear that I do', 114, 'o'),('Oh girl', 114, 'irl'),('Now baby I don''t wanna be just another useless memory holding you tight', 114, 'ight'),('Or just some other ghost out on the street to whom you stop and', 114, 'and'),('politely speak when you pass on by vanishing into the night', 114, 'ight'),('left to vanish into the night', 114, 'ight'),('No baby', 114, 'aby'), ('I met a little girl and I settled down', 115, 'own'),('In a little house out on the edge of town', 115, 'own'),('We got married, and swore we''d never part', 115, 'art'),('Then little by little we drifted from each other''s heart', 115, 'eart'),('At first I thought it was just restlessness', 115, 'estlessness'),('That would fade as time went by and our love grew deep', 115, 'eep'),('In the end it was something more I guess', 115, 'uess'),('That tore us apart and made us weep', 115, 'eep'),('And I''m driving a stolen car', 115, 'ar'),('Down on Eldridge Avenue', 115, 'Avenue'),('Each night I wait to get caught', 115, 'aught'),('But I never do', 115, 'o'),('She asked if I remembered the letters I wrote', 115, 'ote'),('When our love was young and bold', 115, 'old'),('She said last night she read those letters', 115, 'etters'),('And they made her feel one hundred years old', 115, 'old'),('And I''m driving a stolen car', 115, 'ar'),('On a pitch black night', 115, 'ight'),('And I''m telling myself I''m gonna be alright', 115, 'alright'),('But I ride by night and I travel in fear', 115, 'ear'),('That in this darkness I will disappear', 115, 'isappear'), ('Hey, little dolly with the blue jeans on', 116, 'on'),('I wanna ramrod with you honey, till half-past dawn', 116, 'awn'),('Let your hair down sugar and pick up this beat', 116, 'eat'),('Come on and meet me tonight down on Bluebird Street', 116, 'eet'),('I''ve been working all week, I''m up to my neck in hock', 116, 'ock'),('Come Saturday night I let my ramrod rock', 116, 'ock'),('She''s a hot stepping hemi with a four on the floor', 116, 'oor'),('She''s a roadrunner engine in a ''32 Ford', 116, 'ord'),('Late at night when I''m dead on the line', 116, 'ine'),('I swear I think of your pretty face when I let her unwind', 116, 'unwind'),('Well look over yonder see them city lights', 116, 'ights'),('Come on little dolly ''n'' go ramroddin'' tonight', 116, 'onight'),('Come on, come on, come on little baby', 116, 'aby'),('Come on, come on let''s shake it tonight', 116, 'onight'),('Come on, come, come on little sugar', 116, 'ugar'),('Dance with your daddy and we''ll go ramroddin'' tonight', 116, 'onight'),('Hey, little dolly won''t you say you will', 116, 'ill'),('Meet me tonight up on top of the hill', 116, 'ill'),('Well just a few miles cross the county line', 116, 'ine'),('There''s a cute little chapel nestled down in the pines', 116, 'ines'),('Say you''ll be mine little girl I''ll put my foot to the floor', 116, 'oor'),('Give me the word now sugar, we''ll go ramroddin'' forever more', 116, 'ore'), ('You make up your mind, you choose the chance you take', 117, 'ake'),('You ride to where the highway ends and the desert breaks', 117, 'eaks'),('Out on to an open road you ride until the day', 117, 'ay'),('You learn to sleep at night with the price you pay', 117, 'ay'),('Now with their hands held high, they reached out for the open skies', 117, 'ies'),('And in one last breath they built the roads they''d ride to their death', 117, 'eath'),('Driving on through the night, unable to break away', 117, 'away'),('From the restless pull of the price you pay', 117, 'ay'),('Oh, the price you pay, oh, the price you pay', 117, 'ay'),('Now you can''t walk away from the price you pay', 117, 'ay'),('Now they''d come so far and they''d waited so long', 117, 'ong'),('Just to end up caught in a dream where everything goes wrong', 117, 'ong'),('Where the dark of night holds back the light of day', 117, 'ay'),('And you''ve gotta stand and fight for the price you pay', 117, 'ay'),('Little girl down on the strand', 117, 'and'),('With that pretty little baby in your hands', 117, 'ands'),('Do you remember the story of the promised land', 117, 'and'),('How he crossed the desert sands', 117, 'ands'),('And could not enter the chosen land', 117, 'and'),('On the banks of the river he stayed', 117, 'ayed'),('To face the price you pay', 117, 'ay'),('So let the games start, you better run you little wild heart', 117, 'eart'),('You can run through all the nights and all the days', 117, 'ays'),('But just across the county line, a stranger passing through put up a sign', 117, 'ign'),('That counts the men fallen away to the price you pay,', 117, 'ay,'),('and girl before the end of the day,', 117, 'ay,'),('I''m gonna tear it down and throw it away', 117, 'away'), ('When I lost you honey sometimes I think lost my guts too', 118, 'oo'),('And I wish God would send me a word send me something I''m afraid to lose', 118, 'ose'),('Lying in the heat of the night like prisoners all our lives', 118, 'ives'),('I get shivers down my spine and all', 118, 'all'),('I wanna do is hold you tight', 118, 'ight'),('I swear I''ll drive all night just to buy you some shoes', 118, 'oes'),('And to taste your tender charms', 118, 'arms'),('And I just wanna sleep tonight again in your arms', 118, 'arms'),('Tonight there''s fallen angels and they''re waiting for us down in the street', 118, 'eet'),('Tonight there''s calling strangers, hear them crying in defeat.', 118, 'efeat.'),('Let them go, let them go, let them go, do their dances of the dead (let''em go right ahead)', 118, 'ahead)'),('You just dry your eyes girl, and c''mon c''mon c''mon let''s go to bed, baby, baby, baby', 118, 'aby'),('There''s machines and there''s fire waiting on the edge of town', 118, 'own'),('They''re out there for hire but baby they can''t hurt us now', 118, 'ow'),('Cause you''ve got, you''ve got, you''ve got, you''ve got my love, you''ve got my love', 118, 'ove'),('Through the wind, through the rain, the snow, the wind, the rain', 118, 'ain'),('You''ve got, you''ve got my, my love heart and soul', 118, 'oul'), ('Last night I was out driving', 119, 'iving'),('Coming home at the end of the working day', 119, 'ay'),('I was riding alone through the drizzling rain', 119, 'ain'),('On a deserted stretch of a county two-lane', 119, 'o-lane'),('When I cam upon a wreck on the highway', 119, 'ighway'),('There was blood and glass all over', 119, 'over'),('And there was nobody there but me', 119, 'e'),('As the rain tumbled down hard and cold', 119, 'old'),('I seen a young man lying by the side of the road', 119, 'oad'),('He cried Mister, won''t you help me please', 119, 'ease'),('An ambulance finally came and took him to Riverside', 119, 'iverside'),('I watched as they drove him away', 119, 'away'),('And I thought of a girlfriend or a young wife', 119, 'ife'),('And a state trooper knocking in the middle of the night', 119, 'ight'),('To say your baby died in a wreck on the highway', 119, 'ighway'),('Sometimes I sit up in the darkness', 119, 'arkness'),('And I watch my baby as she sleeps', 119, 'eeps'),('Then I climb in bed and I hold her tight', 119, 'ight'),('I just lay there awake in the middle of the night', 119, 'ight'),('Thinking ''bout the wreck on the highway', 119, 'ighway');