package gapdesktoprx.utils
{
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
			worldGraph.downloadKey="pk7kRzzfckbzz4AmH_e3DNA";
			worldGraph.downloadedDate = new Date(2009,10,22,0,0,0,0);
			worldGraph.localPath = "app:/assets/graphs/world/index.html"
			worldGraph.create();
			
			var submitter:Submitter = new Submitter();
			submitter.name = "Claes Johansson";
			submitter.email = "claes.johansson@gapminder.org";
			submitter.create();
			
			var example:Example = new Example();
			example.graph = worldGraph;
			example.submitter = submitter;
			example.descLong = "Health and family size";
			example.descShort = "Health and family size";
			example.urlHash = "$majorMode=chart$is;shi=t;ly=2003;lb=f;il=t;fs=11;al=30;stl=t;st=t;nsl=t;se=t$wst;tts=C$ts;sp=6;ti=2007$zpv;v=0$inc_x;mmid=XCOORDS;iid=phAwcNAVuyj0TAlJeCEzcGQ;by=ind$inc_y;mmid=YCOORDS;iid=phAwcNAVuyj2tPLxKvvnNPA;by=ind$inc_s;uniValue=8.21;iid=phAwcNAVuyj0XOoBL_n5tAQ;by=ind$inc_c;uniValue=255;gid=CATID0;by=grp$map_x;scale=lin;dataMin=0.855;dataMax=8.7$map_y;scale=lin;dataMin=23;dataMax=86$map_s;sma=49;smi=2.65$cd;bd=0$inds=";
			example.create();
			
			
			var tag:Tag = new Tag();
			tag.name = "Health";
			tag.create();
			
			var exampleTag:ExampleTag = new ExampleTag();
			exampleTag.tag = tag;
			exampleTag.example = example;
			exampleTag.create();
						
			tag = new Tag();
			tag.name = "Your own graphs";
			tag.create();

		}
		
	}
}