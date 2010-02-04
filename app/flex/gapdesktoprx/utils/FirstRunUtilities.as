package gapdesktoprx.utils
{
	import gapdesktoprx.components.catalyst.ExampleList;
	import gapdesktoprx.models.Example;
	import gapdesktoprx.models.ExampleTag;
	import gapdesktoprx.models.Graph;
	import gapdesktoprx.models.Submitter;
	import gapdesktoprx.models.Tag;

	public class FirstRunUtilities
	{
		public static function populateDatabase():void {
			var worldGraph:Graph = new Graph();
			worldGraph.name = "World";
			worldGraph.collectionKey="pk7kRzzfckbzz4AmH_e3DNA";
			worldGraph.downloadedDate = new Date(2009,10,22,0,0,0,0);
			worldGraph.shortName = "world";
			worldGraph.create();
			
			var submitter:Submitter = new Submitter();
			submitter.name = "Claes Johansson";
			submitter.email = "claes.johansson@gapminder.org";
			submitter.create();
			
			var example:Example = new Example();
			example.graph = worldGraph;
			example.submitter = submitter;
			example.content = ( <![CDATA[ 
				<p>The entire HIV-epidemic in a single graph. It displays percentage of people living with HIV and Income per capita.</p>
<p>The size of the bubbles shows the actual number of people living with HIV.</p>
<p>Click Play to see the development from 1980 to 2007.</p>
<p><i>Hint: Select one or more counties to see how they have increased or decreased their HIV-prevalence.</i></p>
<p><img src="app:/assets/images/examples/uganda.jpg" width="210" height="142"/></p>
<p><img src="app:/assets/images/examples/botswana.jpg" width="210" height="142"/></p>
<p><img src="app:/assets/images/examples/thailand.jpg" width="210" height="142"/></p>
<p><img src="app:/assets/images/examples/russia.jpg" width="210" height="142"/></p>
     		]]>).toString();
			example.introImage = 'app:/assets/images/examples/uganda.jpg';
			example.introText = 'Is HIV a disease of poverty?';
			
			example.name = "The HIV epidemic 1980-2007";
			example.hash = "$majorMode=chart$is;shi=t;ly=2003;lb=f;il=t;fs=11;al=30;stl=t;st=t;nsl=t;se=t$wst;tts=C$ts;sp=6;ti=2007$zpv;v=0$inc_x;mmid=XCOORDS;iid=phAwcNAVuyj0TAlJeCEzcGQ;by=ind$inc_y;mmid=YCOORDS;iid=phAwcNAVuyj2tPLxKvvnNPA;by=ind$inc_s;uniValue=8.21;iid=phAwcNAVuyj0XOoBL_n5tAQ;by=ind$inc_c;uniValue=255;gid=CATID0;by=grp$map_x;scale=lin;dataMin=0.855;dataMax=8.7$map_y;scale=lin;dataMin=23;dataMax=86$map_s;sma=49;smi=2.65$cd;bd=0$inds=";
			example.create();
			
			
			var tag:Tag = new Tag();
			tag.name = "Health";
			tag.create();
			
			var exampleTag:ExampleTag = new ExampleTag();
			exampleTag.tag = tag;
			exampleTag.example = example;
			exampleTag.create();
						
			
			tag = new Tag();
			tag.name = "HIV";
			tag.create();
			
			exampleTag = new ExampleTag();
			exampleTag.tag = tag;
			exampleTag.example = example;
			exampleTag.create();
			
			tag = new Tag();
			tag.name = "Your own graphs";
			tag.create();
			
			example = new Example();
			example.graph=worldGraph;
			example.submitter = submitter;
			example.name = "User generated graph 1";
			example.hash = "$majorMode=chart$is;shi=t;ly=2003;lb=f;il=t;fs=11;al=30;stl=t;st=t;nsl=t;se=t$wst;tts=C$ts;sp=6;ti=1980$zpv;v=0$inc_x;mmid=XCOORDS;iid=phAwcNAVuyj0TAlJeCEzcGQ;by=ind$inc_y;mmid=YCOORDS;iid=phAwcNAVuyj2tPLxKvvnNPA;by=ind$inc_s;uniValue=8.21;iid=phAwcNAVuyj0XOoBL_n5tAQ;by=ind$inc_c;uniValue=255;gid=CATID0;by=grp$map_x;scale=lin;dataMin=0.855;dataMax=8.7$map_y;scale=lin;dataMin=23;dataMax=86$map_s;sma=49;smi=2.65$cd;bd=0$inds=";
			example.userGenerated=true;
			example.content='<p>Bookmarked graph.</p><p> X axis: HIV, Y axis GDP per capita, Year 2005</p>';
			example.create();
			
			exampleTag = new ExampleTag();
			exampleTag.tag = tag;
			exampleTag.example=example;
			exampleTag.create();

		}
		
	}
}