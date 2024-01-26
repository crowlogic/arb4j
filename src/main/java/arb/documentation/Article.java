package arb.documentation;

public record Article(String author, String title, String year, String journal, String volume, String pages)
                     implements
                     Reference
{

}
