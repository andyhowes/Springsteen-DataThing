--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: albums; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.albums (
    album_id integer NOT NULL,
    album_name character varying(64) NOT NULL,
    release_year integer NOT NULL
);


--
-- Name: albums_album_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.albums_album_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: albums_album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.albums_album_id_seq OWNED BY public.albums.album_id;


--
-- Name: creation_stacks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.creation_stacks (
    line_id integer NOT NULL,
    content_id integer,
    fragment_id integer,
    user_id integer
);


--
-- Name: creation_stacks_line_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.creation_stacks_line_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: creation_stacks_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.creation_stacks_line_id_seq OWNED BY public.creation_stacks.line_id;


--
-- Name: lyrics_fragments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lyrics_fragments (
    fragment_id integer NOT NULL,
    fragment_text text,
    song_id integer,
    rhyme character varying(64)
);


--
-- Name: lyrics_fragments_fragment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lyrics_fragments_fragment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lyrics_fragments_fragment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lyrics_fragments_fragment_id_seq OWNED BY public.lyrics_fragments.fragment_id;


--
-- Name: saved_fragments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.saved_fragments (
    fragment_id integer,
    user_id integer NOT NULL,
    saved_id integer NOT NULL
);


--
-- Name: saved_fragments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.saved_fragments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: saved_fragments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.saved_fragments_id_seq OWNED BY public.saved_fragments.saved_id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.songs (
    song_id integer NOT NULL,
    song_name character varying(64) NOT NULL,
    album_id integer NOT NULL,
    song_lyrics text NOT NULL
);


--
-- Name: songs_song_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.songs_song_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: songs_song_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.songs_song_id_seq OWNED BY public.songs.song_id;


--
-- Name: user_creations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_creations (
    content_id integer NOT NULL,
    content_name character varying(64) NOT NULL,
    content_text text NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: user_creations_content_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_creations_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_creations_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_creations_content_id_seq OWNED BY public.user_creations.content_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    username character varying(64) NOT NULL,
    password character varying(128),
    id integer NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: albums album_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.albums ALTER COLUMN album_id SET DEFAULT nextval('public.albums_album_id_seq'::regclass);


--
-- Name: creation_stacks line_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.creation_stacks ALTER COLUMN line_id SET DEFAULT nextval('public.creation_stacks_line_id_seq'::regclass);


--
-- Name: lyrics_fragments fragment_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lyrics_fragments ALTER COLUMN fragment_id SET DEFAULT nextval('public.lyrics_fragments_fragment_id_seq'::regclass);


--
-- Name: saved_fragments saved_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saved_fragments ALTER COLUMN saved_id SET DEFAULT nextval('public.saved_fragments_id_seq'::regclass);


--
-- Name: songs song_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.songs ALTER COLUMN song_id SET DEFAULT nextval('public.songs_song_id_seq'::regclass);


--
-- Name: user_creations content_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_creations ALTER COLUMN content_id SET DEFAULT nextval('public.user_creations_content_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.albums (album_id, album_name, release_year) FROM stdin;
1	Greetings from Asbury Park, NJ	1973
5	The River	1980
2	The Wild, the Innocent, & the E Street Shuffle	1973
6	Nebraska	1982
3	Born to Run	1975
4	Darkness at thte Edge of Town	1978
7	Born in the USA	1984
\.


--
-- Data for Name: creation_stacks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.creation_stacks (line_id, content_id, fragment_id, user_id) FROM stdin;
6	6	514	6
7	6	990	6
8	6	997	6
9	6	1081	6
10	6	1078	6
11	6	837	6
12	6	869	6
13	6	870	6
14	6	810	6
15	6	890	6
16	6	891	6
17	6	529	6
18	6	939	6
19	6	942	6
20	6	1088	6
21	6	398	6
22	6	968	6
23	6	969	6
24	6	986	6
25	6	1148	6
26	6	820	6
27	6	34	6
28	6	1170	6
29	6	189	6
30	6	237	6
31	6	264	6
32	6	265	6
33	6	286	6
34	6	361	6
35	6	362	6
1	4	1	6
2	4	2	6
3	4	3	6
4	4	4	6
5	4	5	6
\.


--
-- Data for Name: lyrics_fragments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lyrics_fragments (fragment_id, fragment_text, song_id, rhyme) FROM stdin;
1	The screen door slams	1	ams
2	Mary's dress sways	1	ays
3	Like a vision she dances across the porch	1	orch
4	As the radio plays	1	ays
5	Roy Orbison singing for the lonely	1	onely
6	Hey that's me and I want you only	1	only
7	Don't turn me home again	1	again
8	I just can't face myself alone again	1	again
9	Don't run back inside, darling	1	arling
10	You know just what I'm here for	1	or
11	So you're scared and you're thinking	1	inking
12	That maybe we ain't that young anymore	1	anymore
13	Show a little faith, there's magic in the night	1	ight
14	You ain't a beauty, but hey you're alright	1	alright
15	Oh and that's alright with me	1	e
16	You can hide 'neath your covers	1	overs
17	And study your pain	1	ain
18	Make crosses from your lovers	1	overs
19	Throw roses in the rain	1	ain
20	Waste your summer praying in vain	1	ain
21	For a savior to rise from these streets	1	eets
22	Well now I'm no hero	1	ero
23	That's understood	1	understood
24	All the redemption I can offer, girl,	1	irl,
25	Is beneath this dirty hood	1	ood
26	With a chance to make it good somehow	1	omehow
27	Hey what else can we do now	1	ow
28	Except roll down the window	1	indow
29	And let the wind blow back your hair	1	air
30	Well the night's busting open	1	open
31	These two lanes will take us anywhere	1	anywhere
32	We got one last chance to make it real	1	eal
33	To trade in these wings on some wheels	1	eels
34	Climb in back	1	ack
35	Heaven's waiting on down the tracks	1	acks
36	Oh-oh come take my hand	1	and
37	We're riding out tonight to case the promised land	1	and
38	Oh-oh Thunder Road	1	oad
39	Oh Thunder Road	1	oad
40	Oh Thunder Road	1	oad
41	Lying out there like a killer in the sun	1	un
42	Hey I know it's late we can make it if we run	1	un
43	Oh Thunder Road	1	oad
44	Sit tight	1	ight
45	Take hold	1	old
46	Thunder Road	1	oad
47	Well I got this guitar	1	uitar
48	And I learned how to make it talk	1	alk
49	And my car's out back	1	ack
50	If you're ready to take that long walk	1	alk
51	From your front porch to my front seat	1	eat
52	The door's open but the ride it ain't free	1	ee
53	And I know you're lonely	1	onely
54	For words that I ain't spoken	1	oken
55	But tonight we'll be free	1	ee
56	All the promises'll be broken	1	oken
57	There were ghosts in the eyes	1	eyes
58	Of all the boys you sent away	1	away
59	They haunt this dusty beach road	1	oad
60	In the skeleton frames of burned out Chevrolets	1	evrolets
61	They scream your name at night in the street	1	eet
62	Your graduation gown lies in rags at their feet	1	eet
63	And in the lonely cool before the dawn	1	awn
64	You hear their engines roaring on	1	on
65	But when you get to the porch they're gone	1	one
66	On the wind	1	ind
67	So Mary climb in	1	in
68	It's a town full of losers	1	osers
69	We're pulling out of here to win	1	in
70	Tear drops on the city	2	ity
71	Bad Scooter searching for his groove	2	oove
72	Seem like the whole world walking pretty	2	etty
73	And you can't find the room to move	2	ove
74	Well everybody better move over, that's all	2	all
75	I'm running on the bad side	2	ide
76	And I got my back to the wall	2	all
77	Tenth Avenue freeze-out, Tenth Avenue freeze-out	2	eeze-out
78	I'm stranded in the jungle	2	ungle
79	Taking all the heat they was giving	2	iving
80	The night is dark but the sidewalk's bright	2	ight
81	And lined with the light of the living	2	iving
82	From a tenement window a transistor blasts	2	asts
83	Turn around the corner things got real quiet real fast	2	ast
84	She hit me with a Tenth Avenue freeze-out	2	eeze-out
85	Tenth Avenue freeze-out	2	eeze-out
86	And I'm all alone, I'm all alone	2	alone
87	And kid you better get the picture	2	icture
88	And I'm on my own, I'm on my own	2	own
89	And I can't go home	2	ome
90	When the change was made uptown	2	uptown
91	And the Big Man joined the band	2	and
92	From the coastline to the city	2	ity
93	All the little pretties raise their hands	2	ands
94	I'm gonna sit back right easy and laugh	2	augh
95	When Scooter and the Big Man bust this city in half	2	alf
96	With a Tenth Avenue freeze-out, Tenth Avenue freeze-out	2	eeze-out
97	Tenth Avenue freeze-out...	2	eeze-out...
98	In the day we sweat it out in the streets of a runaway American dream	3	eam
99	At night we ride through mansions of glory in suicide machines	3	achines
100	Sprung from cages out on Highway Nine	3	ine
101	Chrome wheeled, fuel injected and steppin' out over the line	3	ine
102	Baby this town rips the bones from your back	3	ack
103	It's a death trap, it's a suicide rap	3	ap
104	We gotta get out while we're young	3	oung
105	'Cause tramps like us, baby we were born to run	3	un
106	Wendy let me in I wanna be your friend	3	iend
107	I want to guard your dreams and visions	3	isions
108	Just wrap your legs round these velvet rims	3	ims
109	and strap your hands across my engines	3	engines
110	Together we could break this trap	3	ap
111	We'll run till we drop, baby we'll never go back	3	ack
112	Will you walk with me out on the wire	3	ire
113	'Cause baby I'm just a scared and lonely rider	3	ider
114	But I gotta find out how it feels	3	eels
115	I want to know if love is wild, girl I want to know if love is real	3	eal
116	Beyond the Palace hemi-powered drones scream down the boulevard	3	oulevard
117	The girls comb their hair in rearview mirrors	3	irrors
118	And the boys try to look so hard	3	ard
119	The amusement park rises bold and stark	3	ark
120	Kids are huddled on the beach in a mist	3	ist
121	I wanna die with you Wendy on the streets tonight	3	onight
122	In an everlasting kiss	3	iss
123	The highway's jammed with broken heroes on a last chance power drive	3	ive
124	Everybody's out on the run tonight but there's no place left to hide	3	ide
125	Together Wendy we'll live with the sadness	3	adness
126	I'll love you with all the madness in my soul	3	oul
127	Someday girl I don't know when we're gonna get to that place	3	ace
128	Where we really want to go and we'll walk in the sun	3	un
129	But till then, tramps like us baby we were born to run	3	un
130	You get up every morning at the sound of the bell	4	ell
131	You get to work late and the boss man's giving you hell	4	ell
132	Till you're out on a midnight run	4	un
133	Losing your heart to a beautiful one	4	one
134	And it feels right as you lock up the house	4	ouse
135	Turn out the lights and step out into the night	4	ight
136	And the world is busting at its seams	4	eams
137	And you're just a prisoner of your dreams	4	eams
138	Holding on for your life 'cause you work all day	4	ay
139	To blow 'em away in the night	4	ight
140	The rat traps filled with soul crusaders	4	usaders
141	The circuits lined and jammed with chromed invaders	4	invaders
142	And she's so pretty that you're lost in the stars	4	ars
143	As you jockey your way through the cars	4	ars
144	And sit at the light, as it changes to green	4	een
145	With your faith in your machine off you scream into the night	4	ight
146	And you're in love with all the wonder it brings	4	ings
147	And every muscle in your body sings as the highway ignites	4	ignites
148	You work nine to five and somehow you survive till the night	4	ight
149	Hell all day they're busting you up on the outside	4	outside
150	But tonight you're gonna break on through to the inside	4	inside
151	And it'll be right, it'll be right, and it'll be tonight	4	onight
152	And you know she will be waiting there	4	ere
153	And you'll find her somehow you swear	4	ear
154	Somewhere tonight you run sad and free	4	ee
155	Until all you can see is the night	4	ight
156	With her killer graces and her secret places	5	aces
157	That no boy can fill with her hands on her hips	5	ips
158	Oh and that smile on her lips	5	ips
159	Because she knows that it kills me	5	e
160	With her soft french cream	5	eam
161	Standing in that doorway like a dream	5	eam
162	I wish she'd just leave me alone	5	alone
163	Because french cream won't soften them boots	5	oots
164	And french kisses will not break that heart of stone	5	one
165	With her long hair falling	5	alling
166	And her eyes that shine like a midnight sun	5	un
167	Oh-o she's the one, she's the one	5	one
168	That Thunder in your heart	5	eart
169	At night when you're kneeling in the dark	5	ark
170	It says you're never gonna leave her	5	er
171	But there's this angel in her eyes	5	eyes
172	That tells such desperate lies	5	ies
173	And all you want to do is believe her	5	er
174	And tonight you'll try just one more time	5	ime
175	To leave it all behind and to break on through	5	ough
176	Oh she can take you, but if she wants to break you	5	ou
177	She's gonna find out that ain't so easy to do	5	o
178	And no matter where you sleep tonight or how far you run	5	un
179	Oh-o she's the one, she's the one	5	one
180	Oh-o and just one kiss	5	iss
181	She'd fill them long summer nights	5	ights
182	With her tenderness that secret pact you made	5	ade
183	Back when her love could save you from the bitterness	5	itterness
184	Oh she's the one, oh she's the one	5	one
185	Oh she's the one, oh she's the one	5	one
186	Oh she's the one, oh she's the one	5	one
187	Hey, Eddie, can you lend me a few bucks	6	ucks
188	And tonight can you get us a ride	6	ide
189	Gotta make it through the tunnel	6	unnel
190	Got a meeting with a man on the other side	6	ide
191	Hey Eddie, this guy, he's the real thing	6	ing
192	So if you want to come along	6	along
193	You gotta promise you won't say anything	6	anything
194	'Cause this guy don't dance	6	ance
195	And the word's been passed this is our last chance	6	ance
196	We gotta stay cool tonight, Eddie	6	Eddie
197	'Cause man, we got ourselves out on that line	6	ine
198	And if we blow this one	6	one
199	They ain't gonna be looking for just me this time	6	ime
200	And all we gotta do is hold up our end	6	end
201	Here stuff this in your pocket	6	ocket
202	It'll look like you're carrying a friend	6	iend
203	And remember, just don't smile	6	ile
204	Change your shirt, 'cause tonight we got style	6	e
205	Well Cherry says she's gonna walk	6	alk
206	'Cause she found out I took her radio and hocked it	6	it
207	But Eddie, man, she don't understand	6	understand
208	That two grand's practically sitting here in my pocket	6	ocket
209	And tonight's gonna be everything that I said	6	aid
210	And when I walk through that door	6	oor
211	I'm just gonna throw that money on the bed	6	ed
212	She'll see this time I wasn't just talking	6	alking
213	Then I'm gonna go out walking	6	alking
214	Hey Eddie, can you catch us a ride?	6	ide?
215	One soft infested summer me and Terry became friends	7	iends
216	Trying in vain to breathe the fire we was born in	7	in
217	Catching rides to the outskirts tying faith between our teeth	7	eeth
218	Sleeping in that old abandoned beach house getting wasted in the heat	7	eat
219	And hiding on the backstreets, hiding on the backstreets	7	ackstreets
220	With a love so hard and filled with defeat	7	efeat
221	Running for our lives at night on them backstreets	7	ackstreets
222	Slow dancing in the dark on the beach at Stockton's Wing	7	ing
223	Where desperate lovers park we sat with the last of the Duke Street Kings	7	ings
224	Huddled in our cars waiting for the bells that ring	7	ing
225	In the deep heart of the night to set us loose from everything	7	everything
226	to go running on the backstreets, running on the backstreets	7	ackstreets
227	We swore we'd live forever on the backstreets we take it together	7	ogether
228	Endless juke joints and Valentino drag where dancers scraped the tears	7	ears
229	Up off the street dressed down in rags running into the darkness	7	arkness
230	Some hurt bad some really dying at night sometimes it seemed	7	eemed
231	You could hear the whole damn city crying blame it on the lies that killed us	7	us
232	Blame it on the truth that ran us down you can blame it all on me Terry	7	erry
233	It don't matter to me now when the breakdown hit at midnight	7	idnight
234	There was nothing left to say but I hated him and I hated you when you went away	7	away
235	Laying here in the dark you're like an angel on my chest	7	est
236	Just another tramp of hearts crying tears of faithlessness	7	aithlessness
237	Remember all the movies, Terry, we'd go see	7	ee
238	Trying to learn how to walk like heroes we thought we had to be	7	e
239	And after all this time to find we're just like all the rest	7	est
240	Stranded in the park and forced to confess	7	onfess
241	To hiding on the backstreets, hiding on the backstreets	7	ackstreets
242	We swore forever friends on the backstreets until the end	7	end
243	Hiding on the backstreets, hiding on the backstreets	7	ackstreets
244	The rangers had a homecoming	8	omecoming
245	In Harlem late last night	8	ight
246	And the Magic Rat drove his sleek machine	8	achine
247	Over the Jersey state line	8	ine
248	Barefoot girl sitting on the hood of a Dodge	8	odge
249	Drinking warm beer in the soft summer rain	8	ain
250	The Rat pulls into town rolls up his pants	8	ants
251	Together they take a stab at romance and disappear down Flamingo Lane	8	ane
252	Well the Maximum Lawman run down Flamingo	8	amingo
253	Chasing the Rat and the barefoot girl	8	irl
254	And the kids round here look just like shadows	8	adows
255	Always quiet, holding hands	8	ands
256	From the churches to the jails	8	ails
257	Tonight all is silence in the world	8	orld
258	As we take our stand	8	and
259	Down in Jungleland	8	ungleland
260	The midnight gang's assembled	8	assembled
261	And picked a rendezvous for the night	8	ight
262	They'll meet 'neath that giant Exxon sign	8	ign
263	That brings this fair city light	8	ight
264	Man there's an opera out on the Turnpike	8	urnpike
265	There's a ballet being fought out in the alley	8	alley
266	Until the local cops, Cherry Tops, rip this holy night	8	ight
267	The street's alive as secret debts are paid	8	aid
268	Contacts made, they vanished unseen	8	unseen
269	Kids flash guitars just like switchblades	8	itchblades
270	Hustling for the record machine	8	achine
271	The hungry and the hunted explode into rock'n'roll bands	8	ands
272	That face off against each other out in the street	8	eet
273	Down in Jungleland	8	ungleland
274	In the parking lot the visionaries dress in the latest rage	8	age
275	Inside the backstreet girls are dancing to the records that the D.J. plays	8	ays
276	Lonely-hearted lovers struggle in dark corners	8	orners
277	Desperate as the night moves on, just a look and a whisper, and they're gone	8	one
278	Beneath the city two hearts beat	8	eat
279	Soul engines running through a night so tender	8	ender
280	In a bedroom locked come whispers of soft refusal and then surrender	8	urrender
281	In the tunnels uptown the Rat's own dream guns him down	8	own
282	As shots echo down them hallways in the night	8	ight
283	No one watches when the ambulance pulls away	8	away
284	Or as the girl shuts out the bedroom light	8	ight
285	Outside the street's on fire in a real death waltz	8	altz
286	Between what's flesh and what's fantasy	8	antasy
287	And the poets down here don't write nothing at all	8	all
288	They just stand back and let it all be	8	e
289	And in the quick of the night they reach for their moment	8	oment
290	And try to make an honest stand	8	and
291	But they wind up wounded, not even dead	8	ead
292	Tonight in Jungleland	8	ungleland
293	You been hurt and you're all cried out you say	9	ay
294	You walk down the street pushin' people outta your way	9	ay
295	You packed your bags and all alone you wanna ride,	9	ide,
296	You don't want nothin', don't need no one by your side	9	ide
297	You're walkin' tough baby, but you're walkin' blind	9	ind
298	The ties that bind	9	ind
299	Now you can't break the ties that bind	9	ind
300	Cheap romance, it's all just a crutch	9	utch
301	You don't want nothin' that anybody can touch	9	ouch
302	You're so afraid of being somebody's fool	9	ool
303	Not walkin' tough baby, not walkin' cool	9	ool
304	You walk cool, but darlin', can you walk the line	9	ine
305	And face the ties that bind	9	ind
306	The ties that bind	9	ind
307	Now you can't break the ties that bind	9	ind
308	I would rather feel the hurt inside, yes I would darlin',	9	arlin',
309	Than know the emptiness your heart must hide,	9	ide,
310	Yes I would darlin', yes I would darlin',	9	arlin',
311	Yes I would baby	9	aby
312	You sit and wonder just who's gonna stop the rain	9	ain
313	Who'll ease the sadness, who's gonna quiet the pain	9	ain
314	It's a long dark highway and a thin white line	9	ine
315	Connecting baby, your heart to mine	9	ine
316	We're runnin' now but darlin' we will stand in time	9	ime
317	To face the ties that bind	9	ind
318	The ties that bind	9	ind
319	Now you can't break the ties that bind	9	ind
320	You can't forsake the ties that bind	9	ind
321	Your mama's yappin' in the back seat	10	eat
322	Tell her to push over and move them big feet	10	eet
323	Every Monday morning I gotta drive her down to the unemployment agency	10	agency
324	Well this morning I ain't fighting, tell her I give up	10	up
325	Tell her she wins if she'll just shut up	10	up
326	But it's the last time that she's gonna be ridin' with me	10	e
327	And you can tell her there's a hot sun beatin' on the blacktop	10	acktop
328	She keeps talkin', she'll be walkin' that last block	10	ock
329	She can take a subway back to the ghetto tonight	10	onight
330	Well I got some beer and the highway's free	10	ee
331	And I got you, and baby you've got me	10	e
332	Hey hey hey, whataya say, Sherry Darlin'	10	arlin'
333	Now there's girls melting on the beach	10	each
334	And they're so fine but so out of reach	10	each
335	Cause I'm stuck in traffic down here on 53rd street	10	eet
336	Now Sherry my love for you is real	10	eal
337	But I didn't count on this package deal	10	eal
338	And baby this car just ain't big enough for her and me	10	e
339	Well let there be sunlight, let there be rain	10	ain
340	Let the brokenhearted love again	10	again
341	Sherry we can run with our arms open wide before the tide	10	ide
342	To all the girls down at Sacred Heart	10	eart
343	And all you operators back in the Park	10	ark
344	Say hey hey hey, whataya say, Sherry Darlin'	10	arlin'
345	Say hey hey hey, whataya say, Sherry Darlin'	10	arlin'
346	Say hey hey hey, whataya say, Sherry Darlin'	10	arlin'
347	Driving home she grabs something to eat	11	eat
348	Turns a corner and drives down her street	11	eet
349	Into a row of houses she just melts away	11	away
350	Like the scenery in another man's play	11	ay
351	Into a house where the blinds are closed	11	osed
352	To keep from seeing things she don't wanna know	11	ow
353	She pulls the blinds and looks out on the street	11	eet
354	The cool of the night takes the edge off the heat	11	eat
355	In the Jackson Cage	11	age
356	Down in the Jackson Cage	11	age
357	You can try with all your might	11	ight
358	But you're reminded every night	11	ight
359	That you been judged and handed life	11	ife
360	Down in the Jackson Cage	11	age
361	Every day ends in wasted motion	11	otion
362	Just crossed swords on the killing floor	11	oor
363	To settle back is to settle without knowing	11	owing
364	The hard edge that you're settling for	11	or
365	Because there's always just one more day	11	ay
366	And it's always gonna be that way	11	ay
367	Little girl you've been down here so long	11	ong
368	I can tell by the way that you move you belong to	11	o
369	The Jackson Cage	11	age
370	Down in Jackson Cage	11	age
371	And it don't matter just what you say	11	ay
372	Are you tough enough to play the game they play	11	ay
373	Or will you just do your time and fade away	11	away
374	Down into the Jackson Cage	11	age
375	Baby there's nights when I dream of a better world	11	orld
376	But I wake up so downhearted girl	11	irl
377	I see you feeling so tired and confused	11	onfused
378	I wonder what it's worth to me or you	11	you
379	Just waiting to see some sun	11	un
380	Never knowing if that day will ever come	11	ome
381	Left alone standing out on the street	11	eet
382	Till you become the hand that turns the key down in	11	in
383	Jackson Cage	11	age
384	Down in Jackson Cage	11	age
385	Well darlin' can you understand	11	understand
386	The way that they will turn a man	11	an
387	Into a stranger to waste away	11	away
388	Down in the Jackson Cage	11	age
389	I went out walking the other day	12	ay
390	Seen a little girl crying along the way	12	ay
391	She'd been hurt so bad said she'd never love again	12	again
392	Someday your crying girl will end	12	end
393	And you'll find once again	12	again
394	Two hearts are better than one	12	one
395	Two hearts girl get the job done	12	one
396	Two hearts are better than one	12	one
397	Once I spent my time playing tough guy scenes	12	enes
398	But I was living in a world of childish dreams	12	eams
399	Someday these childish dreams must end	12	end
400	To become a man and grow up to dream again	12	again
401	Now I believe in the end	12	end
402	Two hearts are better than one...	12	one...
403	Sometimes it might seem like it was planned	12	anned
404	For you to roam empty hearted through this land	12	and
405	Though the world turns you hard and cold	12	old
406	There's one thing mister that I know	12	ow
407	That's if you think your heart is stone	12	one
408	And that you're rough enough to whip this world alone	12	alone
409	Alone buddy there ain't no peace of mind	12	ind
410	That's why I'll keep searching till I find my special one	12	one
411	Two hearts are better than one...	12	one...
412	Well Papa go to bed now it's getting late	13	ate
413	Nothing we can say is gonna change anything now	13	ow
414	I'll be leaving in the morning from St. Mary's Gate	13	ate
415	We wouldn't change this thing even if we could somehow	13	omehow
416	'Cause the darkness of this house has got the best of us	13	us
417	There's a darkness in this town that's got us too	13	oo
418	But they can't touch me now and you can't touch me now	13	ow
419	They ain't gonna do to me what I watched them do to you	13	you
420	So say goodbye it's Independence Day	13	ay
421	It's Independence Day all down the line	13	ine
422	Just say goodbye it's Independence Day	13	ay
423	It's Independence Day this time	13	ime
424	Now I don't know what it always was with us	13	us
425	We chose the words and yeah we drew the lines	13	ines
426	There was just no way this house could hold the two of us	13	us
427	I guess that we were just too much of the same kind	13	ind
428	Well say goodbye it's Independence Day	13	ay
429	All boys must run away come Independence Day	13	ay
430	So say goodbye it's Independence Day	13	ay
431	All men must make their way come Independence Day	13	ay
432	Now the rooms are all empty down at Frankie's joint	13	oint
433	And the highway she's deserted down to Breaker's Point	13	oint
434	There's a lot of people leaving town now	13	ow
435	Leaving their friends their homes	13	omes
436	At night they walk that dark and dusty highway all alone	13	alone
437	Well Papa go to bed now it's getting late	13	ate
438	Nothing we can say can change anything now	13	ow
439	Because there's just different people coming down here now	13	ow
440	And they see things in different ways	13	ays
441	And soon everything we've known will just be swept away	13	away
442	So say goodbye it's Independence Day	13	ay
443	Papa now I know the things you wanted that you could not say	13	ay
444	But won't you just say goodbye it's Independence Day	13	ay
445	I swear I never meant to take those things away	13	away
446	Got a wife and kids in Baltimore Jack	14	ack
447	I went out for a ride and I never went back	14	ack
448	Like a river that don't know where it's flowing	14	owing
449	I took a wrong turn and I just kept going	14	oing
450	Everybody's got a hungry heart	14	eart
451	Everybody's got a hungry heart	14	eart
452	Lay down your money and you play your part	14	art
453	Everybody's got a hungry heart	14	eart
454	I met her in a Kingstown bar	14	ar
455	We fell in love I knew it had to end	14	end
456	We took what we had and we ripped it apart	14	apart
457	Now here I am down in Kingstown again	14	again
458	Everybody's got a hungry heart...	14	eart...
459	Everybody needs a place to rest	14	est
460	Everybody wants to have a home	14	ome
461	Don't make no difference what nobody says	14	ays
462	Ain't nobody like to be alone	14	alone
463	Everybody's got a hungry heart...	14	eart...
464	Put on your best dress baby	15	aby
465	And darlin', fix your hair up right	15	ight
466	Cause there's a party, honey	15	oney
467	Way down beneath the neon lights	15	ights
468	All day you've been working that hard line	15	ine
469	Now tonight you're gonna have a good time	15	ime
470	I work five days a week girl	15	irl
471	Loading crates down on the dock	15	ock
472	I take my hard earned money	15	oney
473	And meet my girl down on the block	15	ock
474	And Monday when the foreman calls time	15	ime
475	I've already got Friday on my mind	15	ind
476	When that whistle blows	15	ows
477	Girl, I'm down the street	15	eet
478	I'm home, I'm out of my work clothes	15	othes
479	When I'm out in the street	15	eet
480	I walk the way I wanna walk	15	alk
481	When I'm out in the street	15	eet
482	I talk the way I wanna talk	15	alk
483	When I'm out in the street	15	eet
484	When I'm out in the street	15	eet
485	When I'm out in the street, girl	15	irl
486	Well, I never feel alone	15	alone
487	When I'm out in the street, girl	15	irl
488	In the crowd I feel at home	15	ome
489	The black and whites they cruise by	15	y
490	And they watch us from the corner of their eye	15	eye
491	But there ain't no doubt girl, down here	15	ere
492	We ain't gonna take what they're handing out	15	out
493	When I'm out in the street	15	eet
494	I walk the way I wanna walk	15	alk
495	When I'm out in the street	15	eet
496	I talk the way I wanna talk	15	alk
497	Baby, out in the street I don't feel sad or blue	15	ue
498	Baby, out in the street I'll be waiting for you	15	you
499	When the whistle blows	15	ows
500	Girl, I'm down the street	15	eet
501	I'm home, I'm out of my work clothes	15	othes
502	When I'm out in the street	15	eet
503	I walk the way I wanna walk	15	alk
504	When I'm out in the street	15	eet
505	I talk the way I wanna talk	15	alk
506	When I'm out in the street	15	eet
507	Pretty girls, they're all passing by	15	y
508	When I'm out in the street	15	eet
509	From the corner, we give them the eye	15	eye
510	Baby, out in the street I just feel all right	15	ight
511	Meet me out in the street, little girl, tonight	15	onight
512	Meet me out in the street	15	eet
513	Meet me out in the street	15	eet
514	My feets were flyin' down the street just the other night	16	ight
515	When a Hong Kong special pulled up at the light	16	ight
516	What was inside, man, was just c'est magnifique	16	agnifique
517	I wanted to hold the bumper and let her drag me down the street	16	eet
518	Ooh, ooh, I gotta crush on you	16	you
519	Ooh, ooh, I gotta crush on you	16	you
520	Ooh, ooh, I gotta crush on you tonight	16	onight
521	Sometimes I spot a little stranger standing 'cross the room	16	oom
522	My brain takes a vacation just to give my heart more room	16	oom
523	For one kiss, darling I swear everything I would give	16	ive
524	Cause you're a walking, talking reason to live	16	ive
525	Well now she might be the talk of high society	16	ociety
526	She's probably got a lousy personality	16	ersonality
527	She might be a heiress to Rockefeller	16	ockefeller
528	She might be a waitress or a bank teller	16	eller
529	She makes the Venus de Milo look like she's got no style	16	yle
530	She make Sheena of the Jungle look meek and mild	16	ild
531	I need a quick shot, Doc, knock me off my feet	16	eet
532	Cause I'll be minding my own business walking down the street... watchout!	16	atchout!
533	Yesterday I went shopping buddy down to the mall	17	all
534	Looking for something pretty I could hang on my wall	17	all
535	I knocked over a lamp before it hit the floor I caught it	17	it
536	A salesman turned around said 'Boy you break that thing you bought it'	17	it'
537	You can look but you better not touch boy	17	oy
538	You can look but you better not touch	17	ouch
539	Mess around and you'll end up in dutch boy	17	oy
540	You can look but you better not no you better not no you better not touch	17	ouch
541	Well I came home from work and I switched on channel 5	17	5
542	There was a pretty little girly lookin' straight into my eyes	17	eyes
543	Well I watched as she wiggled back and forth across the screen	17	een
544	She didn't get me excited she just made me feel mean	17	ean
545	You can look...	17	ook...
546	Well I called up Dirty Annie on the telephone	17	elephone
547	I took her out to the drive-in just to get her alone	17	alone
548	I found a lover's rendezvous the music low set to park	17	ark
549	I heard a tappin' on the window and a voice in the dark	17	ark
550	You can look...	17	ook...
551	I see you walking, baby, down the street	18	eet
552	Pushing that baby carriage at your feet	18	eet
553	I see the lonely ribbon in your hair	18	air
554	Tell me I am the man for whom you put it there	18	ere
555	You never smile girl, you never speak	18	eak
556	You just walk on by, darlin' week after week	18	eek
557	Raising two kids alone in this mixed up world	18	orld
558	Must be a lonely life for a working girl	18	irl
559	Little girl, I wanna marry you	18	you
560	Oh yeah, little girl, I wanna marry you	18	you
561	Yes I do	18	o
562	Little girl, I wanna marry you	18	you
563	Now honey, I don't wanna clip your wings	18	ings
564	But a time comes when two people should think of these things	18	ings
565	Having a home and a family	18	amily
566	Facing up to their responsibilities	18	esponsibilities
567	They say in the end true love prevails	18	evails
568	But in the end true love can't be no fairytale	18	airytale
569	To say I'll make your dreams come true would be wrong	18	ong
570	But maybe, darlin', I could help them along	18	along
571	My daddy said right before he died	18	ied
572	That true, true love was just a lie	18	ie
573	He went to his grave a broken heart	18	eart
574	An unfulfilled life, makes a man hard	18	ard
575	Oh, darlin'	18	arlin'
576	There's something happy and there's something sad	18	ad
577	'Bout wanting somebody, oh so bad,	18	ad,
578	I wear my love darlin', without shame	18	ame
579	I'd be proud if you would wear my name	18	ame
580	I come from down in the valley where mister when you're young	19	young
581	They bring you up to do like your daddy done	19	one
582	Me and Mary we met in high school when she was just seventeen	19	eventeen
583	We'd ride out of that valley down to where the fields were green	19	een
584	We'd go down to the river	19	iver
585	And into the river we'd dive	19	ive
586	Oh down to the river we'd ride	19	ide
587	Then I got Mary pregnant and man that was all she wrote	19	ote
588	And for my nineteenth birthday I got a union card and a wedding coat	19	oat
589	We went down to the courthouse and the judge put it all to rest	19	est
590	No wedding day smiles, no walk down the aisle,	19	aisle,
591	No flowers, no wedding dress	19	ess
592	That night we went down to the river	19	iver
593	And into the river we'd dive	19	ive
594	Oh down to the river we did ride	19	ide
595	I got a job working construction for the Johnstown Company	19	ompany
596	But lately there ain't been much work on account of the economy	19	economy
597	Now all them things that seemed so important	19	important
598	Well mister they vanished right into the air	19	air
599	Now I just act like I don't remember, Mary acts like she don't care	19	are
600	But I remember us riding in my brother's car	19	ar
601	Her body tan and wet down at the reservoir	19	eservoir
602	At night on them banks I'd lie awake	19	awake
603	And pull her close just to feel each breath she'd take	19	ake
604	Now those memories come back to haunt me, they haunt me like a curse	19	urse
605	Is a dream a lie if it don't come true	19	ue
606	Or is it something worse that sends me	19	e
607	Down to the river though I know the river is dry	19	y
608	Down to the river, my baby and I	19	I
609	Oh down to the river we ride	19	ide
610	Do you still say your prayers little darlin' do you go to bed at night	20	ight
611	Prayin' that tomorrow, everything will be alright	20	alright
612	But tommorow's fall in number in number one by one	20	one
613	You wake up and you're dying you don't even know what from	20	om
614	Well they shot you point blank you been shot in the back	20	ack
615	Baby point blank you been fooled this time little girl that's a fact	20	act
616	Right between the eyes baby, point blank right between the pretty lies that they tell	20	ell
617	Little girl you fell	20	ell
618	You grew up where young girls they grow up fast	20	ast
619	You took what you were handed and left behind what was asked	20	asked
620	but what they asked baby wasn't right	20	ight
621	you didn't have to live that life,	20	ife,
622	I was gonna be your Romeo you were gonna be my Juliet	20	uliet
623	These days you don't wait on Romeos you wait on that welfare check	20	eck
624	and on all the pretty things that you can't ever have and on all the promises	20	omises
625	That always end up point blank, shot between the eyes	20	eyes
626	Point blank like little white lies you tell to ease the pain	20	ain
627	You're walkin' in the sights, girl of point blank	20	ank
628	and it's one false move and baby the lights go out	20	out
629	Once I dreamed we were together again baby you and me	20	e
630	Back home in those old clubs the way we used to be	20	e
631	We were standin' at the bar it was hard to hear	20	ear
632	The band was playin' loud and you were shoutin' somethin' in my ear	20	ear
633	You pulled my jacket off and as the drummer counted four	20	our
634	You grabbed my hand and pulled me out on the floor	20	oor
635	You just stood there and held me, then you started dancin' slow	20	ow
636	And as I pulled you tighter I swore I'd never let you go	20	o
637	Well I saw you last night down on the avenue	20	avenue
638	Your face was in the shadows but I knew that it was you	20	you
639	You were standin' in the doorway out of the rain	20	ain
640	You didn't answer when I called out your name	20	ame
641	You just turned, and then you looked away	20	away
642	like just another stranger waitin' to get blown away	20	away
643	Point blank, right between the eyes	20	eyes
644	Point blank, right between the pretty lies you fell	20	ell
645	Point blank, shot right through the heart	20	eart
646	Yea point blank, you've been twisted up till you've become just another part of it	20	it
647	Point blank, you're walkin' in the sights	20	ights
648	Point blank, livin' one false move just one false move away	20	away
649	Point blank, they caught you in their sights	20	ights
650	Point blank, did you forget how to love,	20	ove,
651	girl, did you forget how to fight.	20	ight.
652	Point blank they must have shot you in the head	20	ead
653	Cause point blank, bang bang baby you're dead.	20	ead.
654	Well there she sits buddy just a-gleaming in the sun	21	un
655	There to greet a working man when his day is done	21	one
656	I'm gonna pack my pa and I'm gonna pack my aunt	21	aunt
657	I'm gonna take them down to the Cadillac Ranch	21	anch
658	El Dorado fins, whitewalls and skirts	21	irts
659	Rides just like a little bit of heaven here on earth	21	earth
660	Well buddy when I die throw my body in the back	21	ack
661	And drive me to the junkyard in my Cadillac	21	adillac
662	Cadillac, Cadillac	21	adillac
663	Long and dark, shiny and black	21	ack
664	Open up your engines, let 'em roar	21	oar
665	Tearing up the highway like a big old dinosaur	21	inosaur
666	James Dean in that Mercury fortynine	21	ortynine
667	Junior Johnson runnin' through the woods of Caroline	21	aroline
668	Even Burt Reynolds in that black Trans Am	21	Am
669	All gonna meet down at the Cadillac Ranch	21	anch
670	Hey little girlie in the blue jeans so tight	21	ight
671	Drivin' alone through the Wisconsin night	21	ight
672	You're my last love, baby you're my last chance	21	ance
673	Don't let 'em take me to the Cadillac Ranch	21	anch
674	Pulled up to my house today	21	oday
675	Came and took my little girl away	21	away
676	I got a 007 watch and it's a one and only	22	only
677	It's got a I-Spy beeper that tells me when you're lonely	22	onely
678	I got a Batmobile so I can reach ya' in a fast shake	22	ake
679	When your world's in crisis of an impendin' heartbreak	22	eartbreak
680	Now don't you call James Bond or Secret Agent Man	22	an
681	Cause they can't do it, like I can	22	an
682	I'm a rocker, baby, I'm a rocker - every day	22	ay
683	I'm a rocker, baby, I'm a rocker	22	ocker
684	If you're hanging from a cliff or you're tied to the tracks, girl	22	irl
685	Columbo split and you can't find Kojak	22	ojak
686	True love is broken and your tears are fallin' faster	22	aster
687	You're sufferin' from a pain in your heart or some other natural disaster	22	isaster
688	Now I don't care what kind of shape you're in	22	in
689	If they put up a roadblock, I'll parachute in	22	in
690	I'm a rocker, baby, I'm a rocker - I'm in love	22	ove
691	I'm a rocker, baby, I'm a rocker - every day	22	ay
692	I'm a rocker, baby, I'm a rocker - with you	22	you
693	So you fell for some jerk who was tall, dark and handsome	22	andsome
694	Then he kidnapped your heart and now he's holdin' it for ransom	22	ansom
695	Well, like a mission impossible I'm gonna go and get it back	22	ack
696	You know I would'a taken better care of it, baby, than that	22	at
697	Sometimes I get so hot girl, well, I can't talk	22	alk
698	But when I'm with you I cool off, and I walk	22	alk
699	I'm a rocker, baby, I'm a rocker, and I talk	22	alk
700	I'm a rocker, baby, I'm a rocker, every day	22	ay
701	I'm a rocker, baby, I'm a rocker, every day	22	ay
702	Well now you say you've found another man who does things to you that I can't	23	an't
703	And that no matter what I do it's all over now between me and you girl	23	irl
704	But I can't believe what you say	23	ay
705	No I can't believe what you say	23	ay
706	'cause baby	23	aby
707	I don't wanna fade away	23	away
708	Oh I don't wanna fade away	23	away
709	Tell me what can I do what can I say	23	ay
710	Cause darlin' I don't wanna fade away	23	away
711	Well now you say that you've made up your mind	23	ind
712	it's been such a long, long time since it's been good with us	23	us
713	And that somewhere back along the line you lost your love and I lost your trust	23	ust
714	Now rooms that once were so bright are filled with the coming night, darlin'	23	arlin'
715	You say it's not easy for you	23	you
716	And that you've been so lonely	23	onely
717	While other girls go out doing what they want to do	23	o
718	You say that you miss the nights when we'd go out dancing	23	ancing
719	The days when you and I walked as two	23	o
720	Well girl I miss them too	23	oo
721	Oh I swear that I do	23	o
722	Oh girl	23	irl
723	Now baby I don't wanna be just another useless memory holding you tight	23	ight
724	Or just some other ghost out on the street to whom you stop and	23	and
725	politely speak when you pass on by vanishing into the night	23	ight
726	left to vanish into the night	23	ight
727	No baby	23	aby
728	I met a little girl and I settled down	24	own
729	In a little house out on the edge of town	24	own
730	We got married, and swore we'd never part	24	art
731	Then little by little we drifted from each other's heart	24	eart
732	At first I thought it was just restlessness	24	estlessness
733	That would fade as time went by and our love grew deep	24	eep
734	In the end it was something more I guess	24	uess
735	That tore us apart and made us weep	24	eep
736	And I'm driving a stolen car	24	ar
737	Down on Eldridge Avenue	24	Avenue
738	Each night I wait to get caught	24	aught
739	But I never do	24	o
740	She asked if I remembered the letters I wrote	24	ote
741	When our love was young and bold	24	old
742	She said last night she read those letters	24	etters
743	And they made her feel one hundred years old	24	old
744	And I'm driving a stolen car	24	ar
745	On a pitch black night	24	ight
746	And I'm telling myself I'm gonna be alright	24	alright
747	But I ride by night and I travel in fear	24	ear
748	That in this darkness I will disappear	24	isappear
749	Hey, little dolly with the blue jeans on	25	on
750	I wanna ramrod with you honey, till half-past dawn	25	awn
751	Let your hair down sugar and pick up this beat	25	eat
752	Come on and meet me tonight down on Bluebird Street	25	eet
753	I've been working all week, I'm up to my neck in hock	25	ock
754	Come Saturday night I let my ramrod rock	25	ock
755	She's a hot stepping hemi with a four on the floor	25	oor
756	She's a roadrunner engine in a '32 Ford	25	ord
757	Late at night when I'm dead on the line	25	ine
758	I swear I think of your pretty face when I let her unwind	25	unwind
759	Well look over yonder see them city lights	25	ights
760	Come on little dolly 'n' go ramroddin' tonight	25	onight
761	Come on, come on, come on little baby	25	aby
762	Come on, come on let's shake it tonight	25	onight
763	Come on, come, come on little sugar	25	ugar
764	Dance with your daddy and we'll go ramroddin' tonight	25	onight
765	Hey, little dolly won't you say you will	25	ill
766	Meet me tonight up on top of the hill	25	ill
767	Well just a few miles cross the county line	25	ine
768	There's a cute little chapel nestled down in the pines	25	ines
769	Say you'll be mine little girl I'll put my foot to the floor	25	oor
770	Give me the word now sugar, we'll go ramroddin' forever more	25	ore
771	You make up your mind, you choose the chance you take	26	ake
772	You ride to where the highway ends and the desert breaks	26	eaks
773	Out on to an open road you ride until the day	26	ay
774	You learn to sleep at night with the price you pay	26	ay
775	Now with their hands held high, they reached out for the open skies	26	ies
776	And in one last breath they built the roads they'd ride to their death	26	eath
777	Driving on through the night, unable to break away	26	away
778	From the restless pull of the price you pay	26	ay
779	Oh, the price you pay, oh, the price you pay	26	ay
780	Now you can't walk away from the price you pay	26	ay
781	Now they'd come so far and they'd waited so long	26	ong
782	Just to end up caught in a dream where everything goes wrong	26	ong
783	Where the dark of night holds back the light of day	26	ay
784	And you've gotta stand and fight for the price you pay	26	ay
785	Little girl down on the strand	26	and
786	With that pretty little baby in your hands	26	ands
787	Do you remember the story of the promised land	26	and
788	How he crossed the desert sands	26	ands
789	And could not enter the chosen land	26	and
790	On the banks of the river he stayed	26	ayed
791	To face the price you pay	26	ay
792	So let the games start, you better run you little wild heart	26	eart
793	You can run through all the nights and all the days	26	ays
794	But just across the county line, a stranger passing through put up a sign	26	ign
795	That counts the men fallen away to the price you pay,	26	ay,
796	and girl before the end of the day,	26	ay,
797	I'm gonna tear it down and throw it away	26	away
798	When I lost you honey sometimes I think lost my guts too	27	oo
799	And I wish God would send me a word send me something I'm afraid to lose	27	ose
800	Lying in the heat of the night like prisoners all our lives	27	ives
801	I get shivers down my spine and all	27	all
802	I wanna do is hold you tight	27	ight
803	I swear I'll drive all night just to buy you some shoes	27	oes
804	And to taste your tender charms	27	arms
805	And I just wanna sleep tonight again in your arms	27	arms
806	Tonight there's fallen angels and they're waiting for us down in the street	27	eet
807	Tonight there's calling strangers, hear them crying in defeat.	27	efeat.
808	Let them go, let them go, let them go, do their dances of the dead (let'em go right ahead)	27	ahead)
809	You just dry your eyes girl, and c'mon c'mon c'mon let's go to bed, baby, baby, baby	27	aby
810	There's machines and there's fire waiting on the edge of town	27	own
811	They're out there for hire but baby they can't hurt us now	27	ow
812	Cause you've got, you've got, you've got, you've got my love, you've got my love	27	ove
813	Through the wind, through the rain, the snow, the wind, the rain	27	ain
814	You've got, you've got my, my love heart and soul	27	oul
815	Last night I was out driving	28	iving
816	Coming home at the end of the working day	28	ay
817	I was riding alone through the drizzling rain	28	ain
818	On a deserted stretch of a county two-lane	28	o-lane
819	When I cam upon a wreck on the highway	28	ighway
820	There was blood and glass all over	28	over
821	And there was nobody there but me	28	e
822	As the rain tumbled down hard and cold	28	old
823	I seen a young man lying by the side of the road	28	oad
824	He cried Mister, won't you help me please	28	ease
825	An ambulance finally came and took him to Riverside	28	iverside
826	I watched as they drove him away	28	away
827	And I thought of a girlfriend or a young wife	28	ife
828	And a state trooper knocking in the middle of the night	28	ight
829	To say your baby died in a wreck on the highway	28	ighway
830	Sometimes I sit up in the darkness	28	arkness
831	And I watch my baby as she sleeps	28	eeps
832	Then I climb in bed and I hold her tight	28	ight
833	I just lay there awake in the middle of the night	28	ight
834	Thinking 'bout the wreck on the highway	28	ighway
835	Born down in a dead man's town	29	own
836	The first kick I took was when I hit the ground	29	ound
837	You end up like a dog that's been beat too much	29	uch
838	Till you spend half your life just covering up	29	up
839	Born in the USA, I was born in the USA	29	USA
840	I was born in the USA, born in the USA	29	USA
841	Got in a little hometown jam	29	am
842	So they put a rifle in my hand	29	and
843	Sent me off to a foreign land	29	and
844	To go and kill the yellow man	29	an
845	Born in the USA...	29	USA...
846	Come back home to the refinery	29	efinery
847	Hiring man said 'Son if it was up to me'	29	e'
848	Went down to see my V.A. man	29	an
849	He said 'Son, don't you understand'	29	understand'
850	I had a brother at Khe Sahn	29	ahn
851	Fighting off the Viet Cong	29	ong
852	They're still there, he's all gone	29	one
853	He had a woman he loved in Saigon	29	aigon
854	I got a picture of him in her arms now	29	ow
855	Down in the shadow of the penitentiary	29	enitentiary
856	Out by the gas fires of the refinery	29	efinery
857	I'm ten years burning down the road	29	oad
858	Nowhere to run ain't got nowhere to go	29	o
859	Born in the USA, I was born in the USA	29	USA
860	Born in the USA, I'm a long gone Daddy in the USA	29	USA
861	Born in the USA, Born in the USA	29	USA
862	Born in the USA, I'm a cool rocking Daddy in the USA	29	USA
863	The times are tough now, just getting tougher	30	ougher
864	This old world is rough, it's just getting rougher	30	ougher
865	Cover me, come on baby, cover me	30	e
866	Well I'm looking for a lover who will come on in and cover me	30	e
867	Promise me baby you won't let them find us	30	us
868	Hold me in your arms, let's let our love blind us	30	us
869	Cover me, shut the door and cover me	30	e
870	Well I'm looking for a lover who will come on in and cover me	30	e
871	Outside's the rain, the driving snow	30	ow
872	I can hear the wild wind blowing	30	owing
873	Turn out the light, bolt the door	30	oor
874	I ain't going out there no more	30	ore
875	This whole world is out there just trying to score	30	ore
876	I've seen enough I don't want to see any more,	30	ore,
877	Cover me, come on and cover me	30	e
878	I'm looking for a lover who will come on in and cover me	30	e
879	Looking for a lover who will come on in and cover me	30	e
880	Driving into Darlington County	31	ounty
881	Me and Wayne on the Fourth of July	31	uly
882	Driving into Darlington County	31	ounty
883	Lookin' for some work on the county line	31	ine
884	We drove down from New York City	31	ity
885	Where the girls are pretty but they just wanna know your name	31	ame
886	Driving into Darlington City	31	ity
887	Got a union connection with an uncle of Wayne's	31	ayne's
888	We drove eight hundred miles without seeing a cop	31	op
889	We got rock'n'roll music blasting off the t top	31	op
890	Singing sha la la, sha la la la la la	31	a
891	sha la la la la la la	31	a
892	sha la la, sha la la la la la	31	a
893	sha la la la la la la	31	a
894	Hey little girl, standing on the corner	31	orner
895	Today's your lucky day for shure, all right	31	ight
896	Me and my buddy, we're from New York City	31	ity
897	We got two hundred dollars, we want to rock all night	31	ight
898	Girl, you're lookin' at two big spenders	31	enders
899	Why, the world don't know what me and Wayne might do	31	o
900	Our pa's each own one of the World Trade Centers	31	enters
901	For a kiss and a smile I'll give mine all to you	31	you
902	C'mon baby, take a seat on the fender, it's a long night	31	ight
903	Tell me, what else were you gonna do?	31	o?
904	Just me and you, we could	31	ould
905	Singing sha la la, sha la la la la la	31	a
906	sha la la la la la la	31	a
907	sha la la, sha la la la la la	31	a
908	sha la la la la la la	31	a
909	Little girl, sittin' in the window	31	indow
910	Ain't seen my buddy in seven days	31	ays
911	County man tells me the same thing	31	ing
912	He don't work, and he don't get paid	31	aid
913	Little girl, you're so young and pretty	31	etty
914	Walk with me and you can have your way	31	ay
915	Then we'll leave this Darlington City	31	ity
916	For a ride down that Dixie Highway	31	ighway
917	Singing sha la la, sha la la la la la	31	a
918	sha la la la la la la	31	a
919	sha la la, sha la la la la la	31	a
920	sha la la la la la la	31	a
921	Driving out of Darlington County	31	ounty
922	My eyes seen the glory of the coming Lord	31	ord
923	Driving out of Darlington County	31	ounty
924	Seen Wayne handcuffed to the bumper of a state trooper's Ford	31	ord
925	Singing sha la la, sha la la la la la	31	a
926	sha la la la la la la	31	a
927	sha la la, sha la la la la la	31	a
928	sha la la la la la la	31	a
929	Friday night's pay night guys fresh out of work	32	ork
930	Talking about the weekend scrubbing off the dirt	32	irt
931	Some heading home to their families some looking to get hurt	32	urt
932	Some going down to Stovell wearing trouble on their shirts	32	irts
933	I work for the county out on 95	32	95
934	All day I hold a red flag and watch the traffic pass me by	32	y
935	In my head I keep a picture of a pretty little miss	32	iss
936	Someday mister I'm gonna lead a better life than this	32	is
937	Working on the highway laying down the blacktop	32	acktop
938	Working on the highway all day long I don't stop	32	op
939	Working on the highway blasting through the bedrock	32	edrock
940	Working on the highway, working on the highway	32	ighway
941	I met her at a dance down at the union hall	32	all
942	She was standing with her brothers back up against the wall	32	all
943	Sometimes we'd go walking down the union tracks	32	acks
944	One day I looked straight at her and she looked straight back	32	ack
945	Working on the highway...	32	ighway...
946	I saved up my money and I put it all away	32	away
947	I went to see her daddy but we didn't have much to say	32	ay
948	'Son can't you see that she's just a little girl	32	irl
949	She don't know nothing about this cruel cruel world'	32	orld'
950	We lit out down to Florida we got along all right	32	ight
951	One day her brothers came and got her and they took me in a black and white	32	ite
952	The prosecutor kept the promise that he made on that day	32	ay
953	And the judge got mad and he put me straight away	32	away
954	I wake up every morning to the work bell clang	32	ang
955	Me and the warden go swinging on the Charlotte County road gang	32	ang
956	Working on the highway...	32	ighway...
957	I had a job, I had a girl	33	irl
958	I had something going, mister, in this world	33	orld
959	I got laid off down at the lumber yard	33	yard
960	Our love went bad, times got hard	33	ard
961	Now I work down at the car wash	33	ash
962	Where all it ever does is rain	33	ain
963	Don't you feel like you're a rider on a downbound train	33	ain
964	She just said, 'Joe, I gotta go	33	o
965	We had it once, we ain't got it anymore'	33	anymore'
966	She packed her bags, left me behind	33	ehind
967	She bought a ticket on the Central Line	33	ine
968	Nights as I sleep, I hear that whistle whining	33	ining
969	I feel her kiss in the misty rain	33	ain
970	And I feel like I'm a rider on a downbound train	33	ain
971	Last night I heard your voice	33	oice
972	You were crying, crying, you were so alone	33	alone
973	You said your love had never died	33	ied
974	You were waiting for me at home	33	ome
975	Put on my jacket, I ran through the woods	33	oods
976	I ran till I thought my chest would explode	33	explode
977	There in the clearing, beyond the highway	33	ighway
978	In the moonlight, our wedding house shone	33	one
979	I rushed through the yard	33	yard
980	I burst through the front door, my head pounding hard	33	ard
981	Up the stairs I climbed	33	imbed
982	The room was dark, our bed was empty	33	empty
983	Then I heard that long whistle whine	33	ine
984	And I dropped	33	opped
985	to my knees	33	ees
986	hung my head and cried	33	ied
987	Now I swing a sledge hammer on a railroad gang	33	ang
988	Knocking down them cross ties, working in the rain	33	ain
989	Now, don't it feel like you're a rider on a downbound train	33	ain
990	Hey little girl, is your daddy home?	34	ome?
991	Did he go away and leave you all alone?	34	alone?
992	I got a bad desire	34	esire
993	Oh oh oh, I'm on fire	34	ire
994	Tell me now, baby, is he good to you?	34	you?
995	And can he do to you the things that I do? Oh no	34	o
996	I can take you higher	34	igher
997	Oh oh oh, I'm on fire	34	ire
998	Sometimes it's like someone took a knife, baby	34	aby
999	Edgy and dull and cut a six inch valley	34	alley
1000	Through the middle of my skull	34	ull
1001	At night I wake up with the sheets soaking wet	34	et
1002	And a freight train running through the middle of my head	34	ead
1003	Only you can cool my desire	34	esire
1004	Oh oh oh, I'm on fire	34	ire
1005	Oh oh oh, I'm on fire	34	ire
1006	Oh oh oh, I'm on fire	34	ire
1007	Woo ooh ooh	34	ooh
1008	Woo ooh ooh	34	ooh
1009	Ooh ooh ooh	34	ooh
1010	Woo ooh ooh	34	ooh
1011	Woo ooh ooh	34	ooh
1012	Well, we busted out of class	35	ass
1013	Had to get away from those fools	35	ools
1014	We learned more from a three-minute record, baby	35	aby
1015	Than we ever learned in school	35	ool
1016	Tonight I hear the neighborhood drummer sound	35	ound
1017	I can feel my heart begin to pound	35	ound
1018	You say you're tired and you just want to close your eyes	35	eyes
1019	And follow your dreams down	35	own
1020	Well, we made a promise we swore we'd always remember	35	emember
1021	No retreat, baby, no surrender	35	urrender
1022	Like soldiers in the winter's night with a vow to defend	35	efend
1023	No retreat, baby, no surrender	35	urrender
1024	Well, now young faces grow sad and old	35	old
1025	And hearts of fire grow cold	35	old
1026	We swore blood brothers against the wind	35	ind
1027	Now I'm ready to grow young again	35	again
1028	And hear your sister's voice calling us home	35	ome
1029	Across the open yards	35	yards
1030	Well maybe we'll cut someplace of our own	35	own
1031	With these drums and these guitars	35	uitars
1032	'Cause we made a promise we swore we'd always remember	35	emember
1033	No retreat, baby, no surrender	35	urrender
1034	Blood brothers in the stormy night with a vow to defend	35	efend
1035	No retreat, baby, no surrender	35	urrender
1036	Now on the street tonight the lights grow dim	35	im
1037	The walls of my room are closing in	35	in
1038	There's a war outside still raging	35	aging
1039	You say it ain't ours anymore to win	35	in
1040	I want to sleep beneath	35	eneath
1041	Peaceful skies in my lover's bed	35	ed
1042	With a wide open country in my eyes	35	eyes
1043	And these romantic dreams in my head	35	ead
1044	Once we made a promise we swore we'd always remember	35	emember
1045	No retreat, baby, no surrender	35	urrender
1046	Blood brothers in a stormy night with a vow to defend	35	efend
1047	No retreat, baby, no surrender	35	urrender
1048	No retreat, baby, no surrender	35	urrender
1049	Well I came by your house the other day	36	ay
1050	Your mother said you went away	36	away
1051	She said there was nothing that I could have done	36	one
1052	There was nothing nobody could say	36	ay
1053	Now me and you we've known each other	36	other
1054	Ever since we were sixteen	36	ixteen
1055	I wished I would have known	36	own
1056	I wished I could have called you	36	you
1057	Just to say goodbye	36	oodbye
1058	Bobby Jean	36	ean
1059	Now you hung with me when all the others	36	others
1060	Turned away turned up their nose	36	ose
1061	We like the same music we like the same bands	36	ands
1062	We like the same clothes	36	othes
1063	We told each other that we were the wildest	36	ildest
1064	The wildest things we'd ever seen	36	een
1065	Now I wished I could have talked to you	36	you
1066	Just to say goodbye Bobby Jean	36	ean
1067	Now we went walking in the rain talking about the pain	36	ain
1068	From the world we hid	36	id
1069	Now there ain't nobody nowhere nohow gonna ever understand me	36	e
1070	They way you did	36	id
1071	Maybe you'll be out there on that road somewhere	36	omewhere
1072	In some bus or train traveling along	36	along
1073	In some motel room there'll be a radio playing	36	aying
1074	And you'll hear me sing this song	36	ong
1075	Well if you do you'll know I'm thinking of you	36	you
1076	And all the miles in between	36	etween
1077	And I'm just calling one last time	36	ime
1078	Not to change your mind	36	ind
1079	But just to say I miss you baby	36	aby
1080	Good luck, goodbye	36	oodbye
1081	Bobby Jean	36	ean
1082	We sit in the car outside your house	37	ouse
1083	I can feel the heat coming 'round	37	ound
1084	I go to put my arm around you	37	you
1085	And you give me a look like I'm way out of bounds	37	ounds
1086	Well you let out one of your bored sighs	37	ighs
1087	Well lately when I look into your eyes	37	eyes
1088	I'm goin down, down, down, down	37	own
1089	I'm goin down, down, down, down	37	own
1090	I'm goin down, down, down, down	37	own
1091	I'm goin down, down, down, down	37	own
1092	We get dressed up and we go out, baby, for the night	37	ight
1093	We come home early burning, burning, burning in some firefight	37	irefight
1094	I'm sick and tired of you setting me up yeah	37	yeah
1095	Setting me up just to knock-a knock-a knock-a me down, down, down, down	37	own
1096	I'm goin down, down, down, down	37	own
1097	I'm goin down, down, down, down	37	own
1098	I'm goin down, down, down, down, hey now	37	ow
1099	I pull you close now baby	37	aby
1100	But when we kiss I can feel a doubt	37	oubt
1101	I remember back when we started	37	arted
1102	My kisses used to turn you inside out	37	out
1103	I used to drive you to work in the morning	37	orning
1104	Friday night I'd drive you all around	37	around
1105	You used to love to drive me wild yeah	37	yeah
1106	But lately girl you get your kicks from just driving me down, down, down, down	37	own
1107	I'm goin down, down, down, down	37	own
1108	I'm goin down, down, down, down	37	own
1109	I'm goin down, down, down, down	37	own
1110	I'm goin down, down, down, down	37	own
1111	I'm goin down, down, down, down	37	own
1112	I'm goin down, down, down, down	37	own
1113	I'm goin down, hey bopa d-d-down	37	own
1114	I'm goin down, down, down, down	37	own
1115	I'm goin down, hey bopa d-d-down	37	own
1116	I'm goin down, down, down, yeah	37	yeah
1117	I'm goin down, down, hey bopa hey bopa	37	opa
1118	Hey hey mmm bopa bopa well down	37	own
1119	Hey babe mmm bopa bopa said down	37	own
1120	Hey hey mmm bopa bopa well down	37	own
1121	Hey hey mmm bopa bopa say	37	ay
1122	Hey unh say down, down, down, down, down	37	own
1123	Hey down now, say down, down, down, down, down	37	own
1124	I had a friend was a big baseball player back in high school	38	ool
1125	he could throw that speedball by you	38	you
1126	Make you look like a fool	38	ool
1127	Saw him the other night at this roadside bar I was walking in	38	in
1128	And he was walking out	38	out
1129	We went back inside sat down	38	own
1130	Had a few drinks but all he kept talking about was	38	as
1131	Glory days well they'll pass you by	38	y
1132	Glory days in the wink of a young girl's eye	38	eye
1133	Glory days, glory days	38	ays
1134	There's a girl that lives up the block	38	ock
1135	back in school	38	ool
1136	She could turn all the boys' heads	38	eads
1137	Sometimes on a Friday I'll stop by and have a few drinks	38	inks
1138	After she put her kids to bed	38	ed
1139	Her and her husband Bobby well they split up	38	up
1140	I guess it's two years gone by now	38	ow
1141	We just sit around talking about the old times, she says	38	ays
1142	when she feels like crying she starts laughing thinking about	38	about
1143	Glory days well they'll pass you by	38	y
1144	Glory days in the wink of a young girl's eye	38	eye
1145	Glory days	38	ays
1146	Glory days	38	ays
1147	Think I'm going down to the well tonight	38	onight
1148	And I'm going to drink till I get my fill	38	ill
1149	And I hope when I get old I don't sit around thinking about it	38	it
1150	But I probably will	38	ill
1151	Yeah just sitting back trying to recapture a little of the glory of	38	of
1152	But time slips away and leaves you with nothing mister	38	ister
1153	But boring old stories of glory days	38	ays
1154	Glory days well they'll pass you by	38	y
1155	Glory days in the wink of a young girl's eye	38	eye
1156	Glory days, glory days	38	ays
1157	I get up in the evening	39	evening
1158	And I ain't got nothing to say	39	ay
1159	I come home in the morning	39	orning
1160	I go to bed feeling the same way	39	ay
1161	I ain't got nothing but tired	39	ired
1162	Man I'm just tired and bored with myself	39	yself
1163	Hey there baby I could use just a little help	39	elp
1164	You can't start a fire	39	ire
1165	You can't start a fire without a spark	39	ark
1166	This gun's for hire	39	ire
1167	Even if we're just dancing in the dark	39	ark
1168	Message keeps getting clearer	39	earer
1169	Radio's on and I'm moving 'round the place	39	ace
1170	I check my look in the mirror	39	irror
1171	I wanna change my clothes, my hair, my face	39	ace
1172	Man I ain't getting nowhere just living in a dump like this	39	is
1173	There's something happening somewhere	39	omewhere
1174	Baby I just know that there is	39	is
1175	You can't start a fire	39	ire
1176	You can't start a fire without a spark	39	ark
1177	This gun's for hire	39	ire
1178	Even if we're just dancing in the dark	39	ark
1179	You sit around getting older	39	older
1180	There's a joke here somewhere and it's on me	39	e
1181	I'll shake this world off my shoulders	39	oulders
1182	Come on now baby the laugh's on me	39	e
1183	Stay on the streets of this town	39	own
1184	And they'll be carving you up all right	39	ight
1185	They say you gotta stay hungry	39	ungry
1186	Hey baby I'm just about starving tonight	39	onight
1187	I'm dying for some action	39	action
1188	I'm sick of sitting 'round here trying to write this book	39	ook
1189	I need a love reaction	39	eaction
1190	Come on now baby gimme just one look	39	ook
1191	You can't start a fire	39	ire
1192	Sitting 'round crying over a broken heart	39	eart
1193	This gun's for hire	39	ire
1194	Even if we're just dancing in the dark	39	ark
1195	You can't start a fire	39	ire
1196	Worrying about your little world falling apart	39	apart
1197	This gun's for hire	39	ire
1198	Even if we're just dancing in the dark	39	ark
1199	I was eight years old and running with a dime in my hand	40	and
1200	To the bus stop to pick up a paper for my old man	40	an
1201	I'd sit on his lap	40	ap
1202	In that big old Buick	40	uick
1203	And steer as we drove through town	40	own
1204	He'd tousle my hair	40	air
1205	And say son take a good look around	40	around
1206	This is your hometown	40	ometown
1207	This is your hometown	40	ometown
1208	This is your hometown	40	ometown
1209	This is your hometown	40	ometown
1210	In '65 tension was running high at my high school	40	ool
1211	There was a lot of fights between the black and white	40	ite
1212	There was nothing you could do	40	o
1213	Two cars at a light	40	ight
1214	On a Saturday night	40	ight
1215	In the back seat there was a gun	40	un
1216	Words were passed	40	assed
1217	In a shotgun blast	40	ast
1218	Troubled times had come to my hometown	40	ometown
1219	My hometown	40	ometown
1220	My hometown	40	ometown
1221	My hometown	40	ometown
1222	Now Main Street's whitewashed windows and vacant stores	40	ores
1223	Seems like there ain't nobody wants to come down here no more	40	ore
1224	They're closing down the textile mill across the railroad tracks	40	acks
1225	Foreman says these jobs are going boys and they ain't coming back	40	ack
1226	To your hometown	40	ometown
1227	Your hometown	40	ometown
1228	Your hometown	40	ometown
1229	Your hometown	40	ometown
1230	Last night me and Kate we laid in bed	40	ed
1231	Talking about getting out	40	out
1232	Packing up our bags maybe heading south	40	outh
1233	I'm thirty-five, we got a boy of our own now	40	ow
1234	Last night I sat him up behind the wheel	40	eel
1235	And said son take a good look around	40	around
1236	This is your hometown	40	ometown
\.


--
-- Data for Name: saved_fragments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.saved_fragments (fragment_id, user_id, saved_id) FROM stdin;
1	4	31
2	4	32
3	4	33
4	4	34
5	4	35
258	7	48
1	7	49
27	7	50
34	7	51
36	7	52
229	7	53
596	7	54
597	7	55
599	7	56
603	7	57
604	7	58
612	7	59
1	6	66
2	6	67
3	6	68
4	6	69
5	6	70
6	6	71
242	6	72
243	6	73
244	6	74
245	6	75
246	6	76
247	6	77
1	8	78
2	8	79
3	8	80
4	8	81
5	8	82
6	8	83
43	6	84
44	6	85
45	6	86
115	6	87
115	6	88
114	6	89
7	8	90
8	8	91
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.songs (song_id, song_name, album_id, song_lyrics) FROM stdin;
1	Thunder Road	3	The screen door slams<<<<>>>>Mary's dress sways<<<<>>>>Like a vision she dances across the porch<<<<>>>>As the radio plays<<<<>>>>Roy Orbison singing for the lonely<<<<>>>>Hey that's me and I want you only<<<<>>>>Don't turn me home again<<<<>>>>I just can't face myself alone again<<<<>>>><<<<>>>>Don't run back inside, darling<<<<>>>>You know just what I'm here for<<<<>>>>So you're scared and you're thinking<<<<>>>>That maybe we ain't that young anymore<<<<>>>>Show a little faith, there's magic in the night<<<<>>>>You ain't a beauty, but hey you're alright<<<<>>>>Oh and that's alright with me<<<<>>>><<<<>>>>You can hide 'neath your covers<<<<>>>>And study your pain<<<<>>>>Make crosses from your lovers<<<<>>>>Throw roses in the rain<<<<>>>>Waste your summer praying in vain<<<<>>>>For a savior to rise from these streets<<<<>>>><<<<>>>>Well now I'm no hero<<<<>>>>That's understood<<<<>>>>All the redemption I can offer, girl,<<<<>>>>Is beneath this dirty hood<<<<>>>>With a chance to make it good somehow<<<<>>>>Hey what else can we do now<<<<>>>>Except roll down the window<<<<>>>>And let the wind blow back your hair<<<<>>>>Well the night's busting open<<<<>>>>These two lanes will take us anywhere<<<<>>>>We got one last chance to make it real<<<<>>>>To trade in these wings on some wheels<<<<>>>>Climb in back<<<<>>>>Heaven's waiting on down the tracks<<<<>>>><<<<>>>>Oh-oh come take my hand<<<<>>>>We're riding out tonight to case the promised land<<<<>>>>Oh-oh Thunder Road<<<<>>>>Oh Thunder Road<<<<>>>>Oh Thunder Road<<<<>>>>Lying out there like a killer in the sun<<<<>>>>Hey I know it's late we can make it if we run<<<<>>>>Oh Thunder Road<<<<>>>>Sit tight<<<<>>>>Take hold<<<<>>>>Thunder Road<<<<>>>><<<<>>>>Well I got this guitar<<<<>>>>And I learned how to make it talk<<<<>>>>And my car's out back<<<<>>>>If you're ready to take that long walk<<<<>>>>From your front porch to my front seat<<<<>>>>The door's open but the ride it ain't free<<<<>>>>And I know you're lonely<<<<>>>>For words that I ain't spoken<<<<>>>>But tonight we'll be free<<<<>>>>All the promises'll be broken<<<<>>>><<<<>>>>There were ghosts in the eyes<<<<>>>>Of all the boys you sent away<<<<>>>>They haunt this dusty beach road<<<<>>>>In the skeleton frames of burned out Chevrolets<<<<>>>>They scream your name at night in the street<<<<>>>>Your graduation gown lies in rags at their feet<<<<>>>>And in the lonely cool before the dawn<<<<>>>>You hear their engines roaring on<<<<>>>>But when you get to the porch they're gone<<<<>>>>On the wind<<<<>>>><<<<>>>>So Mary climb in<<<<>>>>It's a town full of losers<<<<>>>>We're pulling out of here to win
2	Tenth Avenue Freeze-out	3	Tear drops on the city<<<<>>>>Bad Scooter searching for his groove<<<<>>>>Seem like the whole world walking pretty<<<<>>>>And you can't find the room to move<<<<>>>>Well everybody better move over, that's all<<<<>>>>I'm running on the bad side<<<<>>>>And I got my back to the wall<<<<>>>>Tenth Avenue freeze-out, Tenth Avenue freeze-out<<<<>>>><<<<>>>>I'm stranded in the jungle<<<<>>>>Taking all the heat they was giving<<<<>>>>The night is dark but the sidewalk's bright<<<<>>>>And lined with the light of the living<<<<>>>>From a tenement window a transistor blasts<<<<>>>>Turn around the corner things got real quiet real fast<<<<>>>>She hit me with a Tenth Avenue freeze-out<<<<>>>>Tenth Avenue freeze-out<<<<>>>>And I'm all alone, I'm all alone<<<<>>>>And kid you better get the picture<<<<>>>>And I'm on my own, I'm on my own<<<<>>>>And I can't go home<<<<>>>><<<<>>>>When the change was made uptown<<<<>>>>And the Big Man joined the band<<<<>>>>From the coastline to the city<<<<>>>>All the little pretties raise their hands<<<<>>>>I'm gonna sit back right easy and laugh<<<<>>>>When Scooter and the Big Man bust this city in half<<<<>>>>With a Tenth Avenue freeze-out, Tenth Avenue freeze-out<<<<>>>>Tenth Avenue freeze-out...
3	Born to Run	3	In the day we sweat it out in the streets of a runaway American dream<<<<>>>>At night we ride through mansions of glory in suicide machines<<<<>>>>Sprung from cages out on Highway Nine<<<<>>>>Chrome wheeled, fuel injected and steppin' out over the line<<<<>>>>Baby this town rips the bones from your back<<<<>>>>It's a death trap, it's a suicide rap<<<<>>>>We gotta get out while we're young<<<<>>>>'Cause tramps like us, baby we were born to run<<<<>>>><<<<>>>>Wendy let me in I wanna be your friend<<<<>>>>I want to guard your dreams and visions<<<<>>>>Just wrap your legs round these velvet rims<<<<>>>>and strap your hands across my engines<<<<>>>>Together we could break this trap<<<<>>>>We'll run till we drop, baby we'll never go back<<<<>>>>Will you walk with me out on the wire<<<<>>>>'Cause baby I'm just a scared and lonely rider<<<<>>>>But I gotta find out how it feels<<<<>>>>I want to know if love is wild, girl I want to know if love is real<<<<>>>><<<<>>>>Beyond the Palace hemi-powered drones scream down the boulevard<<<<>>>>The girls comb their hair in rearview mirrors<<<<>>>>And the boys try to look so hard<<<<>>>>The amusement park rises bold and stark<<<<>>>>Kids are huddled on the beach in a mist<<<<>>>>I wanna die with you Wendy on the streets tonight<<<<>>>>In an everlasting kiss<<<<>>>><<<<>>>>The highway's jammed with broken heroes on a last chance power drive<<<<>>>>Everybody's out on the run tonight but there's no place left to hide<<<<>>>>Together Wendy we'll live with the sadness<<<<>>>>I'll love you with all the madness in my soul<<<<>>>>Someday girl I don't know when we're gonna get to that place<<<<>>>>Where we really want to go and we'll walk in the sun<<<<>>>>But till then, tramps like us baby we were born to run
4	Night	3	You get up every morning at the sound of the bell<<<<>>>>You get to work late and the boss man's giving you hell<<<<>>>>Till you're out on a midnight run<<<<>>>>Losing your heart to a beautiful one<<<<>>>>And it feels right as you lock up the house<<<<>>>>Turn out the lights and step out into the night<<<<>>>><<<<>>>>And the world is busting at its seams<<<<>>>>And you're just a prisoner of your dreams<<<<>>>>Holding on for your life 'cause you work all day<<<<>>>>To blow 'em away in the night<<<<>>>><<<<>>>>The rat traps filled with soul crusaders<<<<>>>>The circuits lined and jammed with chromed invaders<<<<>>>>And she's so pretty that you're lost in the stars<<<<>>>>As you jockey your way through the cars<<<<>>>>And sit at the light, as it changes to green<<<<>>>>With your faith in your machine off you scream into the night<<<<>>>><<<<>>>>And you're in love with all the wonder it brings<<<<>>>>And every muscle in your body sings as the highway ignites<<<<>>>>You work nine to five and somehow you survive till the night<<<<>>>>Hell all day they're busting you up on the outside<<<<>>>>But tonight you're gonna break on through to the inside<<<<>>>>And it'll be right, it'll be right, and it'll be tonight<<<<>>>><<<<>>>>And you know she will be waiting there<<<<>>>>And you'll find her somehow you swear<<<<>>>>Somewhere tonight you run sad and free<<<<>>>>Until all you can see is the night
5	She's the One	3	With her killer graces and her secret places<<<<>>>>That no boy can fill with her hands on her hips<<<<>>>>Oh and that smile on her lips<<<<>>>>Because she knows that it kills me<<<<>>>>With her soft french cream<<<<>>>>Standing in that doorway like a dream<<<<>>>>I wish she'd just leave me alone<<<<>>>>Because french cream won't soften them boots<<<<>>>>And french kisses will not break that heart of stone<<<<>>>>With her long hair falling<<<<>>>>And her eyes that shine like a midnight sun<<<<>>>>Oh-o she's the one, she's the one<<<<>>>><<<<>>>>That Thunder in your heart<<<<>>>>At night when you're kneeling in the dark<<<<>>>>It says you're never gonna leave her<<<<>>>>But there's this angel in her eyes<<<<>>>>That tells such desperate lies<<<<>>>>And all you want to do is believe her<<<<>>>>And tonight you'll try just one more time<<<<>>>>To leave it all behind and to break on through<<<<>>>>Oh she can take you, but if she wants to break you<<<<>>>>She's gonna find out that ain't so easy to do<<<<>>>>And no matter where you sleep tonight or how far you run<<<<>>>>Oh-o she's the one, she's the one<<<<>>>><<<<>>>>Oh-o and just one kiss<<<<>>>>She'd fill them long summer nights<<<<>>>>With her tenderness that secret pact you made<<<<>>>>Back when her love could save you from the bitterness<<<<>>>>Oh she's the one, oh she's the one<<<<>>>>Oh she's the one, oh she's the one<<<<>>>>Oh she's the one, oh she's the one
6	Meeting Across the River	3	Hey, Eddie, can you lend me a few bucks<<<<>>>>And tonight can you get us a ride<<<<>>>>Gotta make it through the tunnel<<<<>>>>Got a meeting with a man on the other side<<<<>>>><<<<>>>>Hey Eddie, this guy, he's the real thing<<<<>>>>So if you want to come along<<<<>>>>You gotta promise you won't say anything<<<<>>>>'Cause this guy don't dance<<<<>>>>And the word's been passed this is our last chance<<<<>>>><<<<>>>>We gotta stay cool tonight, Eddie<<<<>>>>'Cause man, we got ourselves out on that line<<<<>>>>And if we blow this one<<<<>>>>They ain't gonna be looking for just me this time<<<<>>>><<<<>>>>And all we gotta do is hold up our end<<<<>>>>Here stuff this in your pocket<<<<>>>>It'll look like you're carrying a friend<<<<>>>>And remember, just don't smile<<<<>>>>Change your shirt, 'cause tonight we got style<<<<>>>><<<<>>>>Well Cherry says she's gonna walk<<<<>>>>'Cause she found out I took her radio and hocked it<<<<>>>>But Eddie, man, she don't understand<<<<>>>>That two grand's practically sitting here in my pocket<<<<>>>><<<<>>>>And tonight's gonna be everything that I said<<<<>>>>And when I walk through that door<<<<>>>>I'm just gonna throw that money on the bed<<<<>>>>She'll see this time I wasn't just talking<<<<>>>>Then I'm gonna go out walking<<<<>>>><<<<>>>>Hey Eddie, can you catch us a ride?
7	Backstreets	3	One soft infested summer me and Terry became friends<<<<>>>>Trying in vain to breathe the fire we was born in<<<<>>>>Catching rides to the outskirts tying faith between our teeth<<<<>>>>Sleeping in that old abandoned beach house getting wasted in the heat<<<<>>>>And hiding on the backstreets, hiding on the backstreets<<<<>>>><<<<>>>>With a love so hard and filled with defeat<<<<>>>>Running for our lives at night on them backstreets<<<<>>>>Slow dancing in the dark on the beach at Stockton's Wing<<<<>>>>Where desperate lovers park we sat with the last of the Duke Street Kings<<<<>>>>Huddled in our cars waiting for the bells that ring<<<<>>>>In the deep heart of the night to set us loose from everything<<<<>>>>to go running on the backstreets, running on the backstreets<<<<>>>>We swore we'd live forever on the backstreets we take it together<<<<>>>><<<<>>>>Endless juke joints and Valentino drag where dancers scraped the tears<<<<>>>>Up off the street dressed down in rags running into the darkness<<<<>>>>Some hurt bad some really dying at night sometimes it seemed<<<<>>>>You could hear the whole damn city crying blame it on the lies that killed us<<<<>>>>Blame it on the truth that ran us down you can blame it all on me Terry<<<<>>>>It don't matter to me now when the breakdown hit at midnight<<<<>>>>There was nothing left to say but I hated him and I hated you when you went away<<<<>>>><<<<>>>>Laying here in the dark you're like an angel on my chest<<<<>>>>Just another tramp of hearts crying tears of faithlessness<<<<>>>>Remember all the movies, Terry, we'd go see<<<<>>>>Trying to learn how to walk like heroes we thought we had to be<<<<>>>>And after all this time to find we're just like all the rest<<<<>>>>Stranded in the park and forced to confess<<<<>>>>To hiding on the backstreets, hiding on the backstreets<<<<>>>>We swore forever friends on the backstreets until the end<<<<>>>>Hiding on the backstreets, hiding on the backstreets
8	Jungleland	3	The rangers had a homecoming<<<<>>>>In Harlem late last night<<<<>>>>And the Magic Rat drove his sleek machine<<<<>>>>Over the Jersey state line<<<<>>>>Barefoot girl sitting on the hood of a Dodge<<<<>>>>Drinking warm beer in the soft summer rain<<<<>>>>The Rat pulls into town rolls up his pants<<<<>>>>Together they take a stab at romance and disappear down Flamingo Lane<<<<>>>><<<<>>>>Well the Maximum Lawman run down Flamingo<<<<>>>>Chasing the Rat and the barefoot girl<<<<>>>>And the kids round here look just like shadows<<<<>>>>Always quiet, holding hands<<<<>>>>From the churches to the jails<<<<>>>>Tonight all is silence in the world<<<<>>>>As we take our stand<<<<>>>>Down in Jungleland<<<<>>>><<<<>>>>The midnight gang's assembled<<<<>>>>And picked a rendezvous for the night<<<<>>>>They'll meet 'neath that giant Exxon sign<<<<>>>>That brings this fair city light<<<<>>>>Man there's an opera out on the Turnpike<<<<>>>>There's a ballet being fought out in the alley<<<<>>>>Until the local cops, Cherry Tops, rip this holy night<<<<>>>>The street's alive as secret debts are paid<<<<>>>>Contacts made, they vanished unseen<<<<>>>>Kids flash guitars just like switchblades<<<<>>>>Hustling for the record machine<<<<>>>>The hungry and the hunted explode into rock'n'roll bands<<<<>>>>That face off against each other out in the street<<<<>>>>Down in Jungleland<<<<>>>><<<<>>>>In the parking lot the visionaries dress in the latest rage<<<<>>>>Inside the backstreet girls are dancing to the records that the D.J. plays<<<<>>>>Lonely-hearted lovers struggle in dark corners<<<<>>>>Desperate as the night moves on, just a look and a whisper, and they're gone<<<<>>>><<<<>>>>Beneath the city two hearts beat<<<<>>>>Soul engines running through a night so tender<<<<>>>>In a bedroom locked come whispers of soft refusal and then surrender<<<<>>>>In the tunnels uptown the Rat's own dream guns him down<<<<>>>>As shots echo down them hallways in the night<<<<>>>>No one watches when the ambulance pulls away<<<<>>>>Or as the girl shuts out the bedroom light<<<<>>>><<<<>>>>Outside the street's on fire in a real death waltz<<<<>>>>Between what's flesh and what's fantasy<<<<>>>>And the poets down here don't write nothing at all<<<<>>>>They just stand back and let it all be<<<<>>>>And in the quick of the night they reach for their moment<<<<>>>>And try to make an honest stand<<<<>>>>But they wind up wounded, not even dead<<<<>>>>Tonight in Jungleland
9	The Ties That Bind	5	You been hurt and you're all cried out you say<<<<>>>>You walk down the street pushin' people outta your way<<<<>>>>You packed your bags and all alone you wanna ride,<<<<>>>>You don't want nothin', don't need no one by your side<<<<>>>>You're walkin' tough baby, but you're walkin' blind<<<<>>>><<<<>>>>[chorus]<<<<>>>><<<<>>>>The ties that bind<<<<>>>>Now you can't break the ties that bind<<<<>>>>Cheap romance, it's all just a crutch<<<<>>>>You don't want nothin' that anybody can touch<<<<>>>>You're so afraid of being somebody's fool<<<<>>>>Not walkin' tough baby, not walkin' cool<<<<>>>>You walk cool, but darlin', can you walk the line<<<<>>>>And face the ties that bind<<<<>>>>The ties that bind<<<<>>>>Now you can't break the ties that bind<<<<>>>><<<<>>>>I would rather feel the hurt inside, yes I would darlin',<<<<>>>>Than know the emptiness your heart must hide,<<<<>>>>Yes I would darlin', yes I would darlin',<<<<>>>>Yes I would baby<<<<>>>><<<<>>>>You sit and wonder just who's gonna stop the rain<<<<>>>>Who'll ease the sadness, who's gonna quiet the pain<<<<>>>>It's a long dark highway and a thin white line<<<<>>>>Connecting baby, your heart to mine<<<<>>>>We're runnin' now but darlin' we will stand in time<<<<>>>>To face the ties that bind<<<<>>>>The ties that bind<<<<>>>>Now you can't break the ties that bind<<<<>>>>You can't forsake the ties that bind
10	Sherry Darling	5	Your mama's yappin' in the back seat<<<<>>>>Tell her to push over and move them big feet<<<<>>>>Every Monday morning I gotta drive her down to the unemployment agency<<<<>>>>Well this morning I ain't fighting, tell her I give up<<<<>>>>Tell her she wins if she'll just shut up<<<<>>>>But it's the last time that she's gonna be ridin' with me<<<<>>>><<<<>>>>And you can tell her there's a hot sun beatin' on the blacktop<<<<>>>>She keeps talkin', she'll be walkin' that last block<<<<>>>>She can take a subway back to the ghetto tonight<<<<>>>>Well I got some beer and the highway's free<<<<>>>>And I got you, and baby you've got me<<<<>>>>Hey hey hey, whataya say, Sherry Darlin'<<<<>>>><<<<>>>>Now there's girls melting on the beach<<<<>>>>And they're so fine but so out of reach<<<<>>>>Cause I'm stuck in traffic down here on 53rd street<<<<>>>>Now Sherry my love for you is real<<<<>>>>But I didn't count on this package deal<<<<>>>>And baby this car just ain't big enough for her and me<<<<>>>><<<<>>>>[chorus]<<<<>>>><<<<>>>>Well let there be sunlight, let there be rain<<<<>>>>Let the brokenhearted love again<<<<>>>>Sherry we can run with our arms open wide before the tide<<<<>>>>To all the girls down at Sacred Heart<<<<>>>>And all you operators back in the Park<<<<>>>>Say hey hey hey, whataya say, Sherry Darlin'<<<<>>>>Say hey hey hey, whataya say, Sherry Darlin'<<<<>>>>Say hey hey hey, whataya say, Sherry Darlin'
11	Jackson Cage	5	Driving home she grabs something to eat<<<<>>>>Turns a corner and drives down her street<<<<>>>>Into a row of houses she just melts away<<<<>>>>Like the scenery in another man's play<<<<>>>>Into a house where the blinds are closed<<<<>>>>To keep from seeing things she don't wanna know<<<<>>>>She pulls the blinds and looks out on the street<<<<>>>>The cool of the night takes the edge off the heat<<<<>>>><<<<>>>>In the Jackson Cage<<<<>>>>Down in the Jackson Cage<<<<>>>>You can try with all your might<<<<>>>>But you're reminded every night<<<<>>>>That you been judged and handed life<<<<>>>>Down in the Jackson Cage<<<<>>>><<<<>>>>Every day ends in wasted motion<<<<>>>>Just crossed swords on the killing floor<<<<>>>>To settle back is to settle without knowing<<<<>>>>The hard edge that you're settling for<<<<>>>>Because there's always just one more day<<<<>>>>And it's always gonna be that way<<<<>>>>Little girl you've been down here so long<<<<>>>>I can tell by the way that you move you belong to<<<<>>>><<<<>>>>The Jackson Cage<<<<>>>>Down in Jackson Cage<<<<>>>>And it don't matter just what you say<<<<>>>>Are you tough enough to play the game they play<<<<>>>>Or will you just do your time and fade away<<<<>>>>Down into the Jackson Cage<<<<>>>><<<<>>>>Baby there's nights when I dream of a better world<<<<>>>>But I wake up so downhearted girl<<<<>>>>I see you feeling so tired and confused<<<<>>>>I wonder what it's worth to me or you<<<<>>>>Just waiting to see some sun<<<<>>>>Never knowing if that day will ever come<<<<>>>>Left alone standing out on the street<<<<>>>>Till you become the hand that turns the key down in<<<<>>>><<<<>>>>Jackson Cage<<<<>>>>Down in Jackson Cage<<<<>>>>Well darlin' can you understand<<<<>>>>The way that they will turn a man<<<<>>>>Into a stranger to waste away<<<<>>>>Down in the Jackson Cage
12	Two Hearts	5	I went out walking the other day<<<<>>>>Seen a little girl crying along the way<<<<>>>>She'd been hurt so bad said she'd never love again<<<<>>>>Someday your crying girl will end<<<<>>>>And you'll find once again<<<<>>>><<<<>>>>Two hearts are better than one<<<<>>>>Two hearts girl get the job done<<<<>>>>Two hearts are better than one<<<<>>>><<<<>>>>Once I spent my time playing tough guy scenes<<<<>>>>But I was living in a world of childish dreams<<<<>>>>Someday these childish dreams must end<<<<>>>>To become a man and grow up to dream again<<<<>>>>Now I believe in the end<<<<>>>><<<<>>>>Two hearts are better than one...<<<<>>>><<<<>>>>Sometimes it might seem like it was planned<<<<>>>>For you to roam empty hearted through this land<<<<>>>>Though the world turns you hard and cold<<<<>>>>There's one thing mister that I know<<<<>>>>That's if you think your heart is stone<<<<>>>>And that you're rough enough to whip this world alone<<<<>>>>Alone buddy there ain't no peace of mind<<<<>>>>That's why I'll keep searching till I find my special one<<<<>>>><<<<>>>>Two hearts are better than one...
13	Independence Day	5	Well Papa go to bed now it's getting late<<<<>>>>Nothing we can say is gonna change anything now<<<<>>>>I'll be leaving in the morning from St. Mary's Gate<<<<>>>>We wouldn't change this thing even if we could somehow<<<<>>>>'Cause the darkness of this house has got the best of us<<<<>>>>There's a darkness in this town that's got us too<<<<>>>>But they can't touch me now and you can't touch me now<<<<>>>>They ain't gonna do to me what I watched them do to you<<<<>>>><<<<>>>>So say goodbye it's Independence Day<<<<>>>>It's Independence Day all down the line<<<<>>>>Just say goodbye it's Independence Day<<<<>>>>It's Independence Day this time<<<<>>>><<<<>>>>Now I don't know what it always was with us<<<<>>>>We chose the words and yeah we drew the lines<<<<>>>>There was just no way this house could hold the two of us<<<<>>>>I guess that we were just too much of the same kind<<<<>>>><<<<>>>>Well say goodbye it's Independence Day<<<<>>>>All boys must run away come Independence Day<<<<>>>>So say goodbye it's Independence Day<<<<>>>>All men must make their way come Independence Day<<<<>>>><<<<>>>>Now the rooms are all empty down at Frankie's joint<<<<>>>>And the highway she's deserted down to Breaker's Point<<<<>>>>There's a lot of people leaving town now<<<<>>>>Leaving their friends their homes<<<<>>>>At night they walk that dark and dusty highway all alone<<<<>>>><<<<>>>>Well Papa go to bed now it's getting late<<<<>>>>Nothing we can say can change anything now<<<<>>>>Because there's just different people coming down here now<<<<>>>>And they see things in different ways<<<<>>>>And soon everything we've known will just be swept away<<<<>>>><<<<>>>>So say goodbye it's Independence Day<<<<>>>>Papa now I know the things you wanted that you could not say<<<<>>>>But won't you just say goodbye it's Independence Day<<<<>>>>I swear I never meant to take those things away
14	Hungry Heart	5	Got a wife and kids in Baltimore Jack<<<<>>>>I went out for a ride and I never went back<<<<>>>>Like a river that don't know where it's flowing<<<<>>>>I took a wrong turn and I just kept going<<<<>>>>Everybody's got a hungry heart<<<<>>>>Everybody's got a hungry heart<<<<>>>>Lay down your money and you play your part<<<<>>>>Everybody's got a hungry heart<<<<>>>>I met her in a Kingstown bar<<<<>>>>We fell in love I knew it had to end<<<<>>>>We took what we had and we ripped it apart<<<<>>>>Now here I am down in Kingstown again<<<<>>>>Everybody's got a hungry heart...<<<<>>>>Everybody needs a place to rest<<<<>>>>Everybody wants to have a home<<<<>>>>Don't make no difference what nobody says<<<<>>>>Ain't nobody like to be alone<<<<>>>>Everybody's got a hungry heart...
15	Out In The Street	5	Put on your best dress baby<<<<>>>>And darlin', fix your hair up right<<<<>>>>Cause there's a party, honey<<<<>>>>Way down beneath the neon lights<<<<>>>>All day you've been working that hard line<<<<>>>>Now tonight you're gonna have a good time<<<<>>>><<<<>>>>I work five days a week girl<<<<>>>>Loading crates down on the dock<<<<>>>>I take my hard earned money<<<<>>>>And meet my girl down on the block<<<<>>>>And Monday when the foreman calls time<<<<>>>>I've already got Friday on my mind<<<<>>>><<<<>>>>When that whistle blows<<<<>>>>Girl, I'm down the street<<<<>>>>I'm home, I'm out of my work clothes<<<<>>>>When I'm out in the street<<<<>>>>I walk the way I wanna walk<<<<>>>>When I'm out in the street<<<<>>>>I talk the way I wanna talk<<<<>>>>When I'm out in the street<<<<>>>>When I'm out in the street<<<<>>>><<<<>>>>When I'm out in the street, girl<<<<>>>>Well, I never feel alone<<<<>>>>When I'm out in the street, girl<<<<>>>>In the crowd I feel at home<<<<>>>>The black and whites they cruise by<<<<>>>>And they watch us from the corner of their eye<<<<>>>><<<<>>>>But there ain't no doubt girl, down here<<<<>>>>We ain't gonna take what they're handing out<<<<>>>>When I'm out in the street<<<<>>>>I walk the way I wanna walk<<<<>>>>When I'm out in the street<<<<>>>>I talk the way I wanna talk<<<<>>>>Baby, out in the street I don't feel sad or blue<<<<>>>>Baby, out in the street I'll be waiting for you<<<<>>>><<<<>>>>When the whistle blows<<<<>>>>Girl, I'm down the street<<<<>>>>I'm home, I'm out of my work clothes<<<<>>>>When I'm out in the street<<<<>>>>I walk the way I wanna walk<<<<>>>>When I'm out in the street<<<<>>>>I talk the way I wanna talk<<<<>>>><<<<>>>>When I'm out in the street<<<<>>>>Pretty girls, they're all passing by<<<<>>>>When I'm out in the street<<<<>>>>From the corner, we give them the eye<<<<>>>><<<<>>>>Baby, out in the street I just feel all right<<<<>>>>Meet me out in the street, little girl, tonight<<<<>>>>Meet me out in the street<<<<>>>>Meet me out in the street
16	Crush On You	5	My feets were flyin' down the street just the other night<<<<>>>>When a Hong Kong special pulled up at the light<<<<>>>>What was inside, man, was just c'est magnifique<<<<>>>>I wanted to hold the bumper and let her drag me down the street<<<<>>>><<<<>>>>Ooh, ooh, I gotta crush on you<<<<>>>>Ooh, ooh, I gotta crush on you<<<<>>>>Ooh, ooh, I gotta crush on you tonight<<<<>>>><<<<>>>>Sometimes I spot a little stranger standing 'cross the room<<<<>>>>My brain takes a vacation just to give my heart more room<<<<>>>>For one kiss, darling I swear everything I would give<<<<>>>>Cause you're a walking, talking reason to live<<<<>>>><<<<>>>>[chorus]<<<<>>>><<<<>>>>Well now she might be the talk of high society<<<<>>>>She's probably got a lousy personality<<<<>>>>She might be a heiress to Rockefeller<<<<>>>>She might be a waitress or a bank teller<<<<>>>>She makes the Venus de Milo look like she's got no style<<<<>>>>She make Sheena of the Jungle look meek and mild<<<<>>>>I need a quick shot, Doc, knock me off my feet<<<<>>>>Cause I'll be minding my own business walking down the street... watchout!<<<<>>>><<<<>>>>[chorus]
17	You Can Look (But You Better Not Touch)	5	Yesterday I went shopping buddy down to the mall<<<<>>>>Looking for something pretty I could hang on my wall<<<<>>>>I knocked over a lamp before it hit the floor I caught it<<<<>>>>A salesman turned around said ""Boy you break that thing you bought it""<<<<>>>><<<<>>>>You can look but you better not touch boy<<<<>>>>You can look but you better not touch<<<<>>>>Mess around and you'll end up in dutch boy<<<<>>>>You can look but you better not no you better not no you better not touch<<<<>>>><<<<>>>>Well I came home from work and I switched on channel 5<<<<>>>>There was a pretty little girly lookin' straight into my eyes<<<<>>>>Well I watched as she wiggled back and forth across the screen<<<<>>>>She didn't get me excited she just made me feel mean<<<<>>>><<<<>>>>You can look...<<<<>>>><<<<>>>>Well I called up Dirty Annie on the telephone<<<<>>>>I took her out to the drive-in just to get her alone<<<<>>>>I found a lover's rendezvous the music low set to park<<<<>>>>I heard a tappin' on the window and a voice in the dark<<<<>>>><<<<>>>>You can look...
18	I Wanna Marry You	5	I see you walking, baby, down the street<<<<>>>>Pushing that baby carriage at your feet<<<<>>>>I see the lonely ribbon in your hair<<<<>>>>Tell me I am the man for whom you put it there<<<<>>>><<<<>>>>You never smile girl, you never speak<<<<>>>>You just walk on by, darlin' week after week<<<<>>>>Raising two kids alone in this mixed up world<<<<>>>>Must be a lonely life for a working girl<<<<>>>><<<<>>>>Little girl, I wanna marry you<<<<>>>>Oh yeah, little girl, I wanna marry you<<<<>>>>Yes I do<<<<>>>>Little girl, I wanna marry you<<<<>>>><<<<>>>>Now honey, I don't wanna clip your wings<<<<>>>>But a time comes when two people should think of these things<<<<>>>>Having a home and a family<<<<>>>>Facing up to their responsibilities<<<<>>>>They say in the end true love prevails<<<<>>>>But in the end true love can't be no fairytale<<<<>>>>To say I'll make your dreams come true would be wrong<<<<>>>>But maybe, darlin', I could help them along<<<<>>>><<<<>>>>[chorus]<<<<>>>><<<<>>>>My daddy said right before he died<<<<>>>>That true, true love was just a lie<<<<>>>>He went to his grave a broken heart<<<<>>>>An unfulfilled life, makes a man hard<<<<>>>><<<<>>>>Oh, darlin'<<<<>>>>There's something happy and there's something sad<<<<>>>>'Bout wanting somebody, oh so bad,<<<<>>>>I wear my love darlin', without shame<<<<>>>>I'd be proud if you would wear my name
19	The River	5	I come from down in the valley where mister when you're young<<<<>>>>They bring you up to do like your daddy done<<<<>>>>Me and Mary we met in high school when she was just seventeen<<<<>>>>We'd ride out of that valley down to where the fields were green<<<<>>>><<<<>>>>We'd go down to the river<<<<>>>>And into the river we'd dive<<<<>>>>Oh down to the river we'd ride<<<<>>>><<<<>>>>Then I got Mary pregnant and man that was all she wrote<<<<>>>>And for my nineteenth birthday I got a union card and a wedding coat<<<<>>>>We went down to the courthouse and the judge put it all to rest<<<<>>>>No wedding day smiles, no walk down the aisle,<<<<>>>>No flowers, no wedding dress<<<<>>>>That night we went down to the river<<<<>>>>And into the river we'd dive<<<<>>>>Oh down to the river we did ride<<<<>>>><<<<>>>>I got a job working construction for the Johnstown Company<<<<>>>>But lately there ain't been much work on account of the economy<<<<>>>>Now all them things that seemed so important<<<<>>>>Well mister they vanished right into the air<<<<>>>>Now I just act like I don't remember, Mary acts like she don't care<<<<>>>>But I remember us riding in my brother's car<<<<>>>>Her body tan and wet down at the reservoir<<<<>>>>At night on them banks I'd lie awake<<<<>>>>And pull her close just to feel each breath she'd take<<<<>>>>Now those memories come back to haunt me, they haunt me like a curse<<<<>>>>Is a dream a lie if it don't come true<<<<>>>>Or is it something worse that sends me<<<<>>>>Down to the river though I know the river is dry<<<<>>>>Down to the river, my baby and I<<<<>>>>Oh down to the river we ride
20	Point Blank	5	Do you still say your prayers little darlin' do you go to bed at night<<<<>>>>Prayin' that tomorrow, everything will be alright<<<<>>>>But tommorow's fall in number in number one by one<<<<>>>>You wake up and you're dying you don't even know what from<<<<>>>><<<<>>>>Well they shot you point blank you been shot in the back<<<<>>>>Baby point blank you been fooled this time little girl that's a fact<<<<>>>>Right between the eyes baby, point blank right between the pretty lies that they tell<<<<>>>>Little girl you fell<<<<>>>><<<<>>>>You grew up where young girls they grow up fast<<<<>>>>You took what you were handed and left behind what was asked<<<<>>>>but what they asked baby wasn't right<<<<>>>>you didn't have to live that life,<<<<>>>>I was gonna be your Romeo you were gonna be my Juliet<<<<>>>>These days you don't wait on Romeos you wait on that welfare check<<<<>>>>and on all the pretty things that you can't ever have and on all the promises<<<<>>>><<<<>>>>That always end up point blank, shot between the eyes<<<<>>>>Point blank like little white lies you tell to ease the pain<<<<>>>>You're walkin' in the sights, girl of point blank<<<<>>>>and it's one false move and baby the lights go out<<<<>>>><<<<>>>>Once I dreamed we were together again baby you and me<<<<>>>>Back home in those old clubs the way we used to be<<<<>>>>We were standin' at the bar it was hard to hear<<<<>>>>The band was playin' loud and you were shoutin' somethin' in my ear<<<<>>>>You pulled my jacket off and as the drummer counted four<<<<>>>>You grabbed my hand and pulled me out on the floor<<<<>>>>You just stood there and held me, then you started dancin' slow<<<<>>>>And as I pulled you tighter I swore I'd never let you go<<<<>>>><<<<>>>>Well I saw you last night down on the avenue<<<<>>>>Your face was in the shadows but I knew that it was you<<<<>>>>You were standin' in the doorway out of the rain<<<<>>>>You didn't answer when I called out your name<<<<>>>>You just turned, and then you looked away<<<<>>>>like just another stranger waitin' to get blown away<<<<>>>><<<<>>>>Point blank, right between the eyes<<<<>>>>Point blank, right between the pretty lies you fell<<<<>>>>Point blank, shot right through the heart<<<<>>>><<<<>>>>Yea point blank, you've been twisted up till you've become just another part of it<<<<>>>>Point blank, you're walkin' in the sights<<<<>>>>Point blank, livin' one false move just one false move away<<<<>>>>Point blank, they caught you in their sights<<<<>>>>Point blank, did you forget how to love,<<<<>>>>girl, did you forget how to fight.<<<<>>>>Point blank they must have shot you in the head<<<<>>>>Cause point blank, bang bang baby you're dead.
21	Cadillac Ranch	5	Well there she sits buddy just a-gleaming in the sun<<<<>>>>There to greet a working man when his day is done<<<<>>>>I'm gonna pack my pa and I'm gonna pack my aunt<<<<>>>>I'm gonna take them down to the Cadillac Ranch<<<<>>>><<<<>>>>El Dorado fins, whitewalls and skirts<<<<>>>>Rides just like a little bit of heaven here on earth<<<<>>>>Well buddy when I die throw my body in the back<<<<>>>>And drive me to the junkyard in my Cadillac<<<<>>>><<<<>>>>Cadillac, Cadillac<<<<>>>>Long and dark, shiny and black<<<<>>>>Open up your engines, let 'em roar<<<<>>>>Tearing up the highway like a big old dinosaur<<<<>>>><<<<>>>>James Dean in that Mercury '49<<<<>>>>Junior Johnson runnin' through the woods of Caroline<<<<>>>>Even Burt Reynolds in that black Trans Am<<<<>>>>All gonna meet down at the Cadillac Ranch<<<<>>>><<<<>>>>[chorus]<<<<>>>><<<<>>>>Hey little girlie in the blue jeans so tight<<<<>>>>Drivin' alone through the Wisconsin night<<<<>>>>You're my last love, baby you're my last chance<<<<>>>>Don't let 'em take me to the Cadillac Ranch<<<<>>>><<<<>>>>[chorus]<<<<>>>><<<<>>>>Pulled up to my house today<<<<>>>>Came and took my little girl away
28	Wreck On The Highway	5	Last night I was out driving<<<<>>>>Coming home at the end of the working day<<<<>>>>I was riding alone through the drizzling rain<<<<>>>>On a deserted stretch of a county two-lane<<<<>>>>When I came upon a wreck on the highway<<<<>>>><<<<>>>>There was blood and glass all over<<<<>>>>And there was nobody there but me<<<<>>>>As the rain tumbled down hard and cold<<<<>>>>I seen a young man lying by the side of the road<<<<>>>>He cried Mister, won't you help me please<<<<>>>><<<<>>>>An ambulance finally came and took him to Riverside<<<<>>>>I watched as they drove him away<<<<>>>>And I thought of a girlfriend or a young wife<<<<>>>>And a state trooper knocking in the middle of the night<<<<>>>>To say your baby died in a wreck on the highway<<<<>>>><<<<>>>>Sometimes I sit up in the darkness<<<<>>>>And I watch my baby as she sleeps<<<<>>>>Then I climb in bed and I hold her tight<<<<>>>>I just lay there awake in the middle of the night<<<<>>>>Thinking 'bout the wreck on the highway
22	I'm A Rocker	5	I got a 007 watch and it's a one and only<<<<>>>>It's got a I-Spy beeper that tells me when you're lonely<<<<>>>>I got a Batmobile so I can reach ya' in a fast shake<<<<>>>>When your world's in crisis of an impendin' heartbreak<<<<>>>><<<<>>>>Now don't you call James Bond or Secret Agent Man<<<<>>>>Cause they can't do it, like I can<<<<>>>>I'm a rocker, baby, I'm a rocker - every day<<<<>>>>I'm a rocker, baby, I'm a rocker<<<<>>>><<<<>>>>If you're hanging from a cliff or you're tied to the tracks, girl<<<<>>>>Columbo split and you can't find Kojak<<<<>>>>True love is broken and your tears are fallin' faster<<<<>>>>You're sufferin' from a pain in your heart or some other natural disaster<<<<>>>><<<<>>>>Now I don't care what kind of shape you're in<<<<>>>>If they put up a roadblock, I'll parachute in<<<<>>>>I'm a rocker, baby, I'm a rocker - I'm in love<<<<>>>>I'm a rocker, baby, I'm a rocker - every day<<<<>>>>I'm a rocker, baby, I'm a rocker - with you<<<<>>>><<<<>>>>So you fell for some jerk who was tall, dark and handsome<<<<>>>>Then he kidnapped your heart and now he's holdin' it for ransom<<<<>>>>Well, like a mission impossible I'm gonna go and get it back<<<<>>>>You know I would'a taken better care of it, baby, than that<<<<>>>><<<<>>>>Sometimes I get so hot girl, well, I can't talk<<<<>>>>But when I'm with you I cool off, and I walk<<<<>>>>I'm a rocker, baby, I'm a rocker, and I talk<<<<>>>>I'm a rocker, baby, I'm a rocker, every day<<<<>>>>I'm a rocker, baby, I'm a rocker, every day
23	Fade Away	5	Well now you say you've found another man who does things to you that I can't<<<<>>>>And that no matter what I do it's all over now between me and you girl<<<<>>>>But I can't believe what you say<<<<>>>>No I can't believe what you say<<<<>>>>'cause baby<<<<>>>><<<<>>>>I don't wanna fade away<<<<>>>>Oh I don't wanna fade away<<<<>>>>Tell me what can I do what can I say<<<<>>>>Cause darlin' I don't wanna fade away<<<<>>>><<<<>>>>Well now you say that you've made up your mind<<<<>>>>it's been such a long, long time since it's been good with us<<<<>>>>And that somewhere back along the line you lost your love and I lost your trust<<<<>>>>Now rooms that once were so bright are filled with the coming night, darlin'<<<<>>>><<<<>>>>[chorus]<<<<>>>><<<<>>>>You say it's not easy for you<<<<>>>>And that you've been so lonely<<<<>>>>While other girls go out doing what they want to do<<<<>>>>You say that you miss the nights when we'd go out dancing<<<<>>>>The days when you and I walked as two<<<<>>>>Well girl I miss them too<<<<>>>>Oh I swear that I do<<<<>>>>Oh girl<<<<>>>><<<<>>>>Now baby I don't wanna be just another useless memory holding you tight<<<<>>>>Or just some other ghost out on the street to whom you stop and<<<<>>>>politely speak when you pass on by vanishing into the night<<<<>>>>left to vanish into the night<<<<>>>>No baby
24	Stolen Car	5	I met a little girl and I settled down<<<<>>>>In a little house out on the edge of town<<<<>>>>We got married, and swore we'd never part<<<<>>>>Then little by little we drifted from each other's heart<<<<>>>><<<<>>>>At first I thought it was just restlessness<<<<>>>>That would fade as time went by and our love grew deep<<<<>>>>In the end it was something more I guess<<<<>>>>That tore us apart and made us weep<<<<>>>><<<<>>>>And I'm driving a stolen car<<<<>>>>Down on Eldridge Avenue<<<<>>>>Each night I wait to get caught<<<<>>>>But I never do<<<<>>>><<<<>>>>She asked if I remembered the letters I wrote<<<<>>>>When our love was young and bold<<<<>>>>She said last night she read those letters<<<<>>>>And they made her feel one hundred years old<<<<>>>><<<<>>>>And I'm driving a stolen car<<<<>>>>On a pitch black night<<<<>>>>And I'm telling myself I'm gonna be alright<<<<>>>>But I ride by night and I travel in fear<<<<>>>>That in this darkness I will disappear
25	Ramrod	5	Hey, little dolly with the blue jeans on<<<<>>>>I wanna ramrod with you honey, till half-past dawn<<<<>>>>Let your hair down sugar and pick up this beat<<<<>>>>Come on and meet me tonight down on Bluebird Street<<<<>>>>I've been working all week, I'm up to my neck in hock<<<<>>>>Come Saturday night I let my ramrod rock<<<<>>>><<<<>>>>She's a hot stepping hemi with a four on the floor<<<<>>>>She's a roadrunner engine in a '32 Ford<<<<>>>>Late at night when I'm dead on the line<<<<>>>>I swear I think of your pretty face when I let her unwind<<<<>>>>Well look over yonder see them city lights<<<<>>>>Come on little dolly 'n' go ramroddin' tonight<<<<>>>><<<<>>>>Come on, come on, come on little baby<<<<>>>>Come on, come on let's shake it tonight<<<<>>>>Come on, come, come on little sugar<<<<>>>>Dance with your daddy and we'll go ramroddin' tonight<<<<>>>><<<<>>>>Hey, little dolly won't you say you will<<<<>>>>Meet me tonight up on top of the hill<<<<>>>>Well just a few miles cross the county line<<<<>>>>There's a cute little chapel nestled down in the pines<<<<>>>>Say you'll be mine little girl I'll put my foot to the floor<<<<>>>>Give me the word now sugar, we'll go ramroddin' forever more
26	The Price You Pay	5	You make up your mind, you choose the chance you take<<<<>>>>You ride to where the highway ends and the desert breaks<<<<>>>>Out on to an open road you ride until the day<<<<>>>>You learn to sleep at night with the price you pay<<<<>>>><<<<>>>>Now with their hands held high, they reached out for the open skies<<<<>>>>And in one last breath they built the roads they'd ride to their death<<<<>>>>Driving on through the night, unable to break away<<<<>>>>From the restless pull of the price you pay<<<<>>>><<<<>>>>[chorus]<<<<>>>><<<<>>>>Oh, the price you pay, oh, the price you pay<<<<>>>>Now you can't walk away from the price you pay<<<<>>>><<<<>>>>Now they'd come so far and they'd waited so long<<<<>>>>Just to end up caught in a dream where everything goes wrong<<<<>>>>Where the dark of night holds back the light of day<<<<>>>>And you've gotta stand and fight for the price you pay<<<<>>>><<<<>>>>[chorus]<<<<>>>><<<<>>>>Little girl down on the strand<<<<>>>>With that pretty little baby in your hands<<<<>>>>Do you remember the story of the promised land<<<<>>>>How he crossed the desert sands<<<<>>>>And could not enter the chosen land<<<<>>>>On the banks of the river he stayed<<<<>>>>To face the price you pay<<<<>>>><<<<>>>>So let the games start, you better run you little wild heart<<<<>>>>You can run through all the nights and all the days<<<<>>>>But just across the county line, a stranger passing through put up a sign<<<<>>>>That counts the men fallen away to the price you pay,<<<<>>>>and girl before the end of the day,<<<<>>>>I'm gonna tear it down and throw it away
27	Drive All Night	5	When I lost you honey sometimes I think lost my guts too<<<<>>>>And I wish God would send me a word send me something I'm afraid to lose<<<<>>>>Lying in the heat of the night like prisoners all our lives<<<<>>>>I get shivers down my spine and all<<<<>>>>I wanna do is hold you tight<<<<>>>><<<<>>>>I swear I'll drive all night just to buy you some shoes<<<<>>>>And to taste your tender charms<<<<>>>>And I just wanna sleep tonight again in your arms<<<<>>>><<<<>>>>Tonight there's fallen angels and they're waiting for us down in the street<<<<>>>>Tonight there's calling strangers, hear them crying in defeat.<<<<>>>>Let them go, let them go, let them go, do their dances of the dead (let'em go right ahead)<<<<>>>>You just dry your eyes girl, and c'mon c'mon c'mon let's go to bed, baby, baby, baby<<<<>>>><<<<>>>>[chorus]<<<<>>>><<<<>>>>There's machines and there's fire waiting on the edge of town<<<<>>>>They're out there for hire but baby they can't hurt us now<<<<>>>>Cause you've got, you've got, you've got, you've got my love, you've got my love<<<<>>>>Through the wind, through the rain, the snow, the wind, the rain<<<<>>>>You've got, you've got my, my love heart and soul
29	Born in the USA	7	Born down in a dead man's town<<<<>>>>The first kick I took was when I hit the ground<<<<>>>>You end up like a dog that's been beat too much<<<<>>>>Till you spend half your life just covering up<<<<>>>><<<<>>>>Born in the USA, I was born in the USA<<<<>>>>I was born in the USA, born in the USA<<<<>>>><<<<>>>>Got in a little hometown jam<<<<>>>>So they put a rifle in my hand<<<<>>>>Sent me off to a foreign land<<<<>>>>To go and kill the yellow man<<<<>>>><<<<>>>>Born in the USA...<<<<>>>><<<<>>>>Come back home to the refinery<<<<>>>>Hiring man said "Son if it was up to me"<<<<>>>>Went down to see my V.A. man<<<<>>>>He said "Son, don't you understand"<<<<>>>><<<<>>>>I had a brother at Khe Sahn<<<<>>>>Fighting off the Viet Cong<<<<>>>>They're still there, he's all gone<<<<>>>>He had a woman he loved in Saigon<<<<>>>>I got a picture of him in her arms now<<<<>>>><<<<>>>>Down in the shadow of the penitentiary<<<<>>>>Out by the gas fires of the refinery<<<<>>>>I'm ten years burning down the road<<<<>>>>Nowhere to run ain't got nowhere to go<<<<>>>><<<<>>>>Born in the USA, I was born in the USA<<<<>>>>Born in the USA, I'm a long gone Daddy in the USA<<<<>>>>Born in the USA, Born in the USA<<<<>>>>Born in the USA, I'm a cool rocking Daddy in the USA
30	Cover Me	7	The times are tough now, just getting tougher<<<<>>>>This old world is rough, it's just getting rougher<<<<>>>>Cover me, come on baby, cover me<<<<>>>>Well I'm looking for a lover who will come on in and cover me<<<<>>>>Promise me baby you won't let them find us<<<<>>>>Hold me in your arms, let's let our love blind us<<<<>>>>Cover me, shut the door and cover me<<<<>>>>Well I'm looking for a lover who will come on in and cover me<<<<>>>><<<<>>>>Outside's the rain, the driving snow<<<<>>>>I can hear the wild wind blowing<<<<>>>>Turn out the light, bolt the door<<<<>>>>I ain't going out there no more<<<<>>>><<<<>>>>This whole world is out there just trying to score<<<<>>>>I've seen enough I don't want to see any more,<<<<>>>>Cover me, come on and cover me<<<<>>>>I'm looking for a lover who will come on in and cover me<<<<>>>>Looking for a lover who will come on in and cover me
31	Darlington County	7	Driving into Darlington County<<<<>>>>Me and Wayne on the Fourth of July<<<<>>>>Driving into Darlington County<<<<>>>>Lookin' for some work on the county line<<<<>>>>We drove down from New York City<<<<>>>>Where the girls are pretty but they just wanna know your name<<<<>>>>Driving into Darlington City<<<<>>>>Got a union connection with an uncle of Wayne's<<<<>>>>We drove eight hundred miles without seeing a cop<<<<>>>>We got rock'n'roll music blasting off the t top<<<<>>>><<<<>>>>Singing sha la la, sha la la la la la<<<<>>>>sha la la la la la la<<<<>>>>sha la la, sha la la la la la<<<<>>>>sha la la la la la la<<<<>>>><<<<>>>>Hey little girl, standing on the corner<<<<>>>>Today's your lucky day for shure, all right<<<<>>>>Me and my buddy, we're from New York City<<<<>>>>We got two hundred dollars, we want to rock all night<<<<>>>>Girl, you're lookin' at two big spenders<<<<>>>>Why, the world don't know what me and Wayne might do<<<<>>>>Our pa's each own one of the World Trade Centers<<<<>>>>For a kiss and a smile I'll give mine all to you<<<<>>>>C'mon baby, take a seat on the fender, it's a long night<<<<>>>>Tell me, what else were you gonna do?<<<<>>>>Just me and you, we could ...<<<<>>>><<<<>>>>Singing sha la la, sha la la la la la<<<<>>>>sha la la la la la la<<<<>>>>sha la la, sha la la la la la<<<<>>>>sha la la la la la la<<<<>>>><<<<>>>>Little girl, sittin' in the window<<<<>>>>Ain't seen my buddy in seven days<<<<>>>>County man tells me the same thing<<<<>>>>He don't work, and he don't get paid<<<<>>>>Little girl, you're so young and pretty<<<<>>>>Walk with me and you can have your way<<<<>>>>Then we'll leave this Darlington City<<<<>>>>For a ride down that Dixie Highway<<<<>>>><<<<>>>>Singing sha la la, sha la la la la la<<<<>>>>sha la la la la la la<<<<>>>>sha la la, sha la la la la la<<<<>>>>sha la la la la la la<<<<>>>><<<<>>>>Driving out of Darlington County<<<<>>>>My eyes seen the glory of the coming Lord<<<<>>>>Driving out of Darlington County<<<<>>>>Seen Wayne handcuffed to the bumper of a state trooper's Ford<<<<>>>><<<<>>>>Singing sha la la, sha la la la la la<<<<>>>>sha la la la la la la<<<<>>>>sha la la, sha la la la la la<<<<>>>>sha la la la la la la
32	Working on the Highway	7	Friday night's pay night guys fresh out of work<<<<>>>>Talking about the weekend scrubbing off the dirt<<<<>>>>Some heading home to their families some looking to get hurt<<<<>>>>Some going down to Stovell wearing trouble on their shirts<<<<>>>><<<<>>>>I work for the county out on 95<<<<>>>>All day I hold a red flag and watch the traffic pass me by<<<<>>>>In my head I keep a picture of a pretty little miss<<<<>>>>Someday mister I'm gonna lead a better life than this<<<<>>>><<<<>>>>Working on the highway laying down the blacktop<<<<>>>>Working on the highway all day long I don't stop<<<<>>>>Working on the highway blasting through the bedrock<<<<>>>>Working on the highway, working on the highway<<<<>>>><<<<>>>>I met her at a dance down at the union hall<<<<>>>>She was standing with her brothers back up against the wall<<<<>>>>Sometimes we'd go walking down the union tracks<<<<>>>>One day I looked straight at her and she looked straight back<<<<>>>><<<<>>>>Working on the highway...<<<<>>>><<<<>>>>I saved up my money and I put it all away<<<<>>>>I went to see her daddy but we didn't have much to say<<<<>>>>"Son can't you see that she's just a little girl<<<<>>>>She don't know nothing about this cruel cruel world"<<<<>>>><<<<>>>>We lit out down to Florida we got along all right<<<<>>>>One day her brothers came and got her and they took me in a black and white<<<<>>>><<<<>>>>The prosecutor kept the promise that he made on that day<<<<>>>>And the judge got mad and he put me straight away<<<<>>>>I wake up every morning to the work bell clang<<<<>>>>Me and the warden go swinging on the Charlotte County road gang<<<<>>>><<<<>>>>Working on the highway...
33	Downbound Train	7	I had a job, I had a girl<<<<>>>>I had something going, mister, in this world<<<<>>>>I got laid off down at the lumber yard<<<<>>>>Our love went bad, times got hard<<<<>>>>Now I work down at the car wash<<<<>>>>Where all it ever does is rain<<<<>>>>Don't you feel like you're a rider on a downbound train<<<<>>>><<<<>>>>She just said, "Joe, I gotta go<<<<>>>>We had it once, we ain't got it anymore"<<<<>>>>She packed her bags, left me behind<<<<>>>>She bought a ticket on the Central Line<<<<>>>><<<<>>>>Nights as I sleep, I hear that whistle whining<<<<>>>>I feel her kiss in the misty rain<<<<>>>>And I feel like I'm a rider on a downbound train<<<<>>>><<<<>>>>Last night I heard your voice<<<<>>>>You were crying, crying, you were so alone<<<<>>>>You said your love had never died<<<<>>>>You were waiting for me at home<<<<>>>>Put on my jacket, I ran through the woods<<<<>>>>I ran till I thought my chest would explode<<<<>>>>There in the clearing, beyond the highway<<<<>>>>In the moonlight, our wedding house shone<<<<>>>><<<<>>>>I rushed through the yard<<<<>>>>I burst through the front door, my head pounding hard<<<<>>>>Up the stairs I climbed<<<<>>>>The room was dark, our bed was empty<<<<>>>>Then I heard that long whistle whine<<<<>>>>And I dropped<<<<>>>>to my knees<<<<>>>>hung my head and cried<<<<>>>><<<<>>>>Now I swing a sledge hammer on a railroad gang<<<<>>>>Knocking down them cross ties, working in the rain<<<<>>>>Now, don't it feel like you're a rider on a downbound train
34	I'm on Fire	7	Hey little girl, is your daddy home?<<<<>>>>Did he go away and leave you all alone? Mhmm<<<<>>>>I got a bad desire<<<<>>>>Oh oh oh, I'm on fire<<<<>>>><<<<>>>>Tell me now, baby, is he good to you?<<<<>>>>And can he do to you the things that I do? Oh no<<<<>>>>I can take you higher<<<<>>>>Oh oh oh, I'm on fire<<<<>>>><<<<>>>>Sometimes it's like someone took a knife, baby<<<<>>>>Edgy and dull and cut a six inch valley<<<<>>>>Through the middle of my skull<<<<>>>><<<<>>>>At night I wake up with the sheets soaking wet<<<<>>>>And a freight train running through the middle of my head<<<<>>>>Only you can cool my desire<<<<>>>><<<<>>>>Oh oh oh, I'm on fire<<<<>>>>Oh oh oh, I'm on fire<<<<>>>>Oh oh oh, I'm on fire<<<<>>>><<<<>>>>Woo ooh ooh<<<<>>>>Woo ooh ooh<<<<>>>>Ooh ooh ooh<<<<>>>>Woo ooh ooh<<<<>>>>Woo ooh ooh
35	No Surrender	7	Well, we busted out of class<<<<>>>>Had to get away from those fools<<<<>>>>We learned more from a three-minute record, baby<<<<>>>>Than we ever learned in school<<<<>>>><<<<>>>>Tonight I hear the neighborhood drummer sound<<<<>>>>I can feel my heart begin to pound<<<<>>>>You say you're tired and you just want to close your eyes<<<<>>>>And follow your dreams down<<<<>>>><<<<>>>>Well, we made a promise we swore we'd always remember<<<<>>>>No retreat, baby, no surrender<<<<>>>>Like soldiers in the winter's night with a vow to defend<<<<>>>>No retreat, baby, no surrender<<<<>>>><<<<>>>>Well, now young faces grow sad and old<<<<>>>>And hearts of fire grow cold<<<<>>>>We swore blood brothers against the wind<<<<>>>>Now I'm ready to grow young again<<<<>>>><<<<>>>>And hear your sister's voice calling us home<<<<>>>>Across the open yards<<<<>>>>Well maybe we'll cut someplace of our own<<<<>>>>With these drums and these guitars<<<<>>>><<<<>>>>'Cause we made a promise we swore we'd always remember<<<<>>>>No retreat, baby, no surrender<<<<>>>>Blood brothers in the stormy night with a vow to defend<<<<>>>>No retreat, baby, no surrender<<<<>>>><<<<>>>>Now on the street tonight the lights grow dim<<<<>>>>The walls of my room are closing in<<<<>>>>There's a war outside still raging<<<<>>>>You say it ain't ours anymore to win<<<<>>>><<<<>>>>I want to sleep beneath<<<<>>>>Peaceful skies in my lover's bed<<<<>>>>With a wide open country in my eyes<<<<>>>>And these romantic dreams in my head<<<<>>>><<<<>>>>Once we made a promise we swore we'd always remember<<<<>>>>No retreat, baby, no surrender<<<<>>>>Blood brothers in a stormy night with a vow to defend<<<<>>>>No retreat, baby, no surrender<<<<>>>>No retreat, baby, no surrender
36	Bobby Jean	7	Well I came by your house the other day<<<<>>>>Your mother said you went away<<<<>>>>She said there was nothing that I could have done<<<<>>>>There was nothing nobody could say<<<<>>>><<<<>>>>Now me and you we've known each other<<<<>>>>Ever since we were sixteen<<<<>>>>I wished I would have known<<<<>>>>I wished I could have called you<<<<>>>>Just to say goodbye<<<<>>>>Bobby Jean<<<<>>>><<<<>>>>Now you hung with me when all the others<<<<>>>>Turned away turned up their nose<<<<>>>>We like the same music we like the same bands<<<<>>>>We like the same clothes<<<<>>>>We told each other that we were the wildest<<<<>>>>The wildest things we'd ever seen<<<<>>>>Now I wished I could have talked to you<<<<>>>>Just to say goodbye Bobby Jean<<<<>>>><<<<>>>>Now we went walking in the rain talking about the pain<<<<>>>>From the world we hid<<<<>>>>Now there ain't nobody nowhere nohow gonna ever understand me<<<<>>>>They way you did<<<<>>>>Maybe you'll be out there on that road somewhere<<<<>>>>In some bus or train traveling along<<<<>>>>In some motel room there'll be a radio playing<<<<>>>>And you'll hear me sing this song<<<<>>>>Well if you do you'll know I'm thinking of you<<<<>>>>And all the miles in between<<<<>>>>And I'm just calling one last time<<<<>>>>Not to change your mind<<<<>>>>But just to say I miss you baby<<<<>>>>Good luck, goodbye<<<<>>>>Bobby Jean
37	I'm Going Down	7	We sit in the car outside your house<<<<>>>>I can feel the heat coming 'round<<<<>>>>I go to put my arm around you<<<<>>>>And you give me a look like I'm way out of bounds<<<<>>>>Well you let out one of your bored sighs<<<<>>>>Well lately when I look into your eyes<<<<>>>>I'm goin down, down, down, down<<<<>>>>I'm goin down, down, down, down<<<<>>>>I'm goin down, down, down, down<<<<>>>>I'm goin down, down, down, down<<<<>>>><<<<>>>>We get dressed up and we go out, baby, for the night<<<<>>>>We come home early burning, burning, burning in some firefight<<<<>>>>I'm sick and tired of you setting me up yeah<<<<>>>>Setting me up just to knock-a knock-a knock-a me down, down, down, down<<<<>>>>I'm goin down, down, down, down<<<<>>>>I'm goin down, down, down, down<<<<>>>>I'm goin down, down, down, down, hey now<<<<>>>><<<<>>>>I pull you close now baby<<<<>>>>But when we kiss I can feel a doubt<<<<>>>>I remember back when we started<<<<>>>>My kisses used to turn you inside out<<<<>>>><<<<>>>>I used to drive you to work in the morning<<<<>>>>Friday night I'd drive you all around<<<<>>>>You used to love to drive me wild yeah<<<<>>>>But lately girl you get your kicks from just driving me down, down, down, down<<<<>>>>I'm goin down, down, down, down<<<<>>>>I'm goin down, down, down, down<<<<>>>>I'm goin down, down, down, down<<<<>>>><<<<>>>>I'm goin down, down, down, down<<<<>>>>I'm goin down, down, down, down<<<<>>>>I'm goin down, down, down, down<<<<>>>>I'm goin down, hey bopa d-d-down<<<<>>>>I'm goin down, down, down, down<<<<>>>>I'm goin down, hey bopa d-d-down<<<<>>>>I'm goin down, down, down, yeah<<<<>>>>I'm goin down, down, hey bopa hey bopa<<<<>>>>Hey hey mmm bopa bopa well down<<<<>>>>Hey babe mmm bopa bopa said down<<<<>>>>Hey hey mmm bopa bopa well down<<<<>>>>Hey hey mmm bopa bopa say<<<<>>>>Hey unh say down, down, down, down, down<<<<>>>>Hey down now, say down, down, down, down, down
38	Glory Days	7	I had a friend was a big baseball player back in high school<<<<>>>>he could throw that speedball by you<<<<>>>>Make you look like a fool<<<<>>>>Saw him the other night at this roadside bar I was walking in<<<<>>>>And he was walking out<<<<>>>>We went back inside sat down<<<<>>>>Had a few drinks but all he kept talking about was<<<<>>>><<<<>>>>Glory days well they'll pass you by<<<<>>>>Glory days in the wink of a young girl's eye<<<<>>>>Glory days, glory days<<<<>>>><<<<>>>>There's a girl that lives up the block<<<<>>>>back in school<<<<>>>>She could turn all the boys' heads<<<<>>>>Sometimes on a Friday I'll stop by and have a few drinks<<<<>>>>After she put her kids to bed<<<<>>>>Her and her husband Bobby well they split up<<<<>>>>I guess it's two years gone by now<<<<>>>>We just sit around talking about the old times, she says<<<<>>>>when she feels like crying she starts laughing thinking about<<<<>>>><<<<>>>>Glory days well they'll pass you by<<<<>>>>Glory days in the wink of a young girl's eye<<<<>>>>Glory days<<<<>>>>Glory days<<<<>>>><<<<>>>>Think I'm going down to the well tonight<<<<>>>>And I'm going to drink till I get my fill<<<<>>>>And I hope when I get old I don't sit around thinking about it<<<<>>>>But I probably will<<<<>>>>Yeah just sitting back trying to recapture a little of the glory of<<<<>>>>But time slips away and leaves you with nothing mister<<<<>>>>But boring old stories of glory days<<<<>>>><<<<>>>>Glory days well they'll pass you by<<<<>>>>Glory days in the wink of a young girl's eye<<<<>>>>Glory days, glory days
39	Dancing in the Dark	7	I get up in the evening<<<<>>>>And I ain't got nothing to say<<<<>>>>I come home in the morning<<<<>>>>I go to bed feeling the same way<<<<>>>>I ain't got nothing but tired<<<<>>>>Man I'm just tired and bored with myself<<<<>>>>Hey there baby I could use just a little help<<<<>>>><<<<>>>>You can't start a fire<<<<>>>>You can't start a fire without a spark<<<<>>>>This gun's for hire<<<<>>>>Even if we're just dancing in the dark<<<<>>>><<<<>>>>Message keeps getting clearer<<<<>>>>Radio's on and I'm moving 'round the place<<<<>>>>I check my look in the mirror<<<<>>>>I wanna change my clothes, my hair, my face<<<<>>>>Man I ain't getting nowhere just living in a dump like this<<<<>>>>There's something happening somewhere<<<<>>>>Baby I just know that there is<<<<>>>><<<<>>>>You can't start a fire<<<<>>>>You can't start a fire without a spark<<<<>>>>This gun's for hire<<<<>>>>Even if we're just dancing in the dark<<<<>>>><<<<>>>>You sit around getting older<<<<>>>>There's a joke here somewhere and it's on me<<<<>>>>I'll shake this world off my shoulders<<<<>>>>Come on now baby the laugh's on me<<<<>>>>Stay on the streets of this town<<<<>>>>And they'll be carving you up all right<<<<>>>>They say you gotta stay hungry<<<<>>>>Hey baby I'm just about starving tonight<<<<>>>>I'm dying for some action<<<<>>>>I'm sick of sitting 'round here trying to write this book<<<<>>>>I need a love reaction<<<<>>>>Come on now baby gimme just one look<<<<>>>><<<<>>>>You can't start a fire<<<<>>>>Sitting 'round crying over a broken heart<<<<>>>>This gun's for hire<<<<>>>>Even if we're just dancing in the dark<<<<>>>>You can't start a fire<<<<>>>>Worrying about your little world falling apart<<<<>>>>This gun's for hire<<<<>>>>Even if we're just dancing in the dark
40	My Hometown	7	I was eight years old and running with a dime in my hand<<<<>>>>To the bus stop to pick up a paper for my old man<<<<>>>>I'd sit on his lap<<<<>>>>In that big old Buick<<<<>>>>And steer as we drove through town<<<<>>>>He'd tousle my hair<<<<>>>>And say son take a good look around<<<<>>>>This is your hometown<<<<>>>>This is your hometown<<<<>>>>This is your hometown<<<<>>>>This is your hometown<<<<>>>><<<<>>>>In '65 tension was running high at my high school<<<<>>>>There was a lot of fights between the black and white<<<<>>>>There was nothing you could do<<<<>>>>Two cars at a light<<<<>>>>On a Saturday night<<<<>>>>In the back seat there was a gun<<<<>>>>Words were passed<<<<>>>>In a shotgun blast<<<<>>>>Troubled times had come to my hometown<<<<>>>>My hometown<<<<>>>>My hometown<<<<>>>>My hometown<<<<>>>><<<<>>>>Now Main Street's whitewashed windows and vacant stores<<<<>>>>Seems like there ain't nobody wants to come down here no more<<<<>>>>They're closing down the textile mill across the railroad tracks<<<<>>>>Foreman says these jobs are going boys and they ain't coming back<<<<>>>>To your hometown<<<<>>>>Your hometown<<<<>>>>Your hometown<<<<>>>>Your hometown<<<<>>>><<<<>>>>Last night me and Kate we laid in bed<<<<>>>>Talking about getting out<<<<>>>>Packing up our bags maybe heading south<<<<>>>>I'm thirty-five, we got a boy of our own now<<<<>>>>Last night I sat him up behind the wheel<<<<>>>>And said son take a good look around<<<<>>>>This is your hometown
\.


--
-- Data for Name: user_creations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_creations (content_id, content_name, content_text, user_id) FROM stdin;
6	I'm On Fire	bee	6
4	Born to Run	born to bee	6
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (username, password, id) FROM stdin;
bongar	$2a$10$EWGRjJ.WHPFX93T60UEHGeoFDD0H9Uqv.qwMLbvFfITnAr1aW2w46	1
ahowes83	$2a$10$2ZsvsxIjoG5MAbM81PQc1OdkttxZA4GiI2py7o0N9qk.OGHSKemXy	2
blerg	$2a$10$rooXI5EaNt03tnvrNaBfe.zMXbH/LT1TelMUV2xMOLh0SiH5ixdXC	3
max	$2a$10$8j1Vl6U6t02TajTOj9PdW.F1OSr/8kfJP4nz9tTIOEhuAel8QNpEC	4
new-user	$2a$10$aCEnkq7clpMztKNO8KoGhur.7CLGnbw3X5oZgLGYcwy9B4NLDogfy	5
Katie	$2a$10$dWXaQGzIutuQvt2MJcfO1O0M4oPTBGNvrG51LzDm9BNw2tu96HLLO	6
MaxWeinberg	$2a$10$oN/x2qQUbPN1UzcY6uwLvutQyfZiC8mgF26BZjmz6/fsvdcvSb1fq	7
andy	$2a$10$sE2lAm.cPDoUkT2qzMfz5O0moUdqZXHvxpIYwQYlfNGeKghKKQvby	8
\.


--
-- Name: albums_album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.albums_album_id_seq', 18, true);


--
-- Name: creation_stacks_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.creation_stacks_line_id_seq', 1, false);


--
-- Name: lyrics_fragments_fragment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lyrics_fragments_fragment_id_seq', 1236, true);


--
-- Name: saved_fragments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.saved_fragments_id_seq', 91, true);


--
-- Name: songs_song_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.songs_song_id_seq', 40, true);


--
-- Name: user_creations_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_creations_content_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (album_id);


--
-- Name: creation_stacks creation_stacks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.creation_stacks
    ADD CONSTRAINT creation_stacks_pkey PRIMARY KEY (line_id);


--
-- Name: lyrics_fragments lyrics_fragments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lyrics_fragments
    ADD CONSTRAINT lyrics_fragments_pkey PRIMARY KEY (fragment_id);


--
-- Name: saved_fragments saved_fragments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saved_fragments
    ADD CONSTRAINT saved_fragments_pkey PRIMARY KEY (saved_id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (song_id);


--
-- Name: user_creations user_creations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_creations
    ADD CONSTRAINT user_creations_pkey PRIMARY KEY (content_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: creation_stacks creation_stacks_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.creation_stacks
    ADD CONSTRAINT creation_stacks_fk0 FOREIGN KEY (fragment_id) REFERENCES public.lyrics_fragments(fragment_id);


--
-- Name: creation_stacks creation_stacks_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.creation_stacks
    ADD CONSTRAINT creation_stacks_fk1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: creation_stacks creation_stacks_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.creation_stacks
    ADD CONSTRAINT creation_stacks_fk2 FOREIGN KEY (content_id) REFERENCES public.user_creations(content_id);


--
-- Name: saved_fragments saved fragments_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saved_fragments
    ADD CONSTRAINT "saved fragments_fk0" FOREIGN KEY (fragment_id) REFERENCES public.lyrics_fragments(fragment_id);


--
-- Name: saved_fragments saved_fragments_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saved_fragments
    ADD CONSTRAINT saved_fragments_fk1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: songs songs_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_fk0 FOREIGN KEY (album_id) REFERENCES public.albums(album_id);


--
-- PostgreSQL database dump complete
--

