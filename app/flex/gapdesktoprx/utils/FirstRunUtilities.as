package gapdesktoprx.utils
{
	import com.adobe.serialization.json.JSON;

	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	import gapdesktoprx.models.Example;
	import gapdesktoprx.models.ExampleTag;
	import gapdesktoprx.models.Graph;
	import gapdesktoprx.models.Submitter;
	import gapdesktoprx.models.Tag;

	import mx.collections.ArrayCollection;

	public class FirstRunUtilities
	{

		public static function populateDatabase():void
		{
			var worldGraph:Graph=new Graph();
			worldGraph.name="World";
			worldGraph.collectionKey="pk7kRzzfckbzz4AmH_e3DNA";
			worldGraph.downloadedDate=new Date(2010, 01, 22, 0, 0, 0, 0);
			worldGraph.shortName="world";
			worldGraph.create();

			var submitter:Submitter=new Submitter();
			submitter.name="Claes Johansson";
			submitter.email="claes.johansson@gapminder.org";
			submitter.create();

			var tag:Tag;
			var example:Example;

			var file:File=File.applicationDirectory.resolvePath('assets/initialcontent/tags.json');
			var fileStream:FileStream=new FileStream();
			fileStream.open(file, FileMode.READ);
			var str:String=fileStream.readUTFBytes(fileStream.bytesAvailable);
			var tagArray:Array=JSON.decode(str) as Array;
			fileStream.close();


			for each (var inTag:Object in tagArray)
			{
				tag=new Tag();
				tag.name=inTag.name;
				tag.id=inTag.id;
				tag.create();
				for each (var inExample:Object in inTag.examples)
				{
					example=new Example();
					example.id=inExample.id;
					example.name=inExample.name;
					example.hash=inExample.hash;
					example.userGenerated=false;
					example.mainTag=tag;
					example.graph=worldGraph
					example.submitter=submitter;

					example.create();
				}
			}


		}



	}
}