
/**
namespace URLparser;

class Program
{
    static void Main()
    {
        string[] urls = {
            "https://www.apple.com/iphone",
            "ftp://www.example.com/employee",
            "https://google.com",
            "www.apple.com"
        };

        foreach (var url in urls)
        {
            var parsedUrl = ParseUrl(url);
            Console.WriteLine($"URL: {url}");
            Console.WriteLine($"[protocol] = \"{parsedUrl.protocol}\"");
            Console.WriteLine($"[server] = \"{parsedUrl.server}\"");
            Console.WriteLine($"[resource] = \"{parsedUrl.resource}\"");
            Console.WriteLine();
        }
    }

    static (string protocol, string server, string resource) ParseUrl(string url)
    {
        string protocol = "";
        string server = "";
        string resource = "";

        int protocolEndIndex = url.IndexOf("://");
        if (protocolEndIndex != -1)
        {
            protocol = url.Substring(0, protocolEndIndex);
            url = url.Substring(protocolEndIndex + 3);
        }

        int resourceStartIndex = url.IndexOf('/');
        if (resourceStartIndex != -1)
        {
            server = url.Substring(0, resourceStartIndex);
            resource = url.Substring(resourceStartIndex + 1);
        }
        else
        {
            server = url;
        }

        return (protocol, server, resource);
    }
}
**/