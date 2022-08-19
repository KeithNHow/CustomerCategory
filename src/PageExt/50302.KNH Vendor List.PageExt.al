/// <summary>
/// PageExtension KNH Vendor List (ID 50004) extends Record Vendor List.
/// </summary>
pageextension 50302 "KNH Vendor List" extends "Vendor List"
{
    trigger OnOpenPage()
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        Headers: HttpHeaders;
    begin
        Request.Method := 'Post';
        Request.SetRequestUri('https://ptsv2.com/t/zvpyk-1638197011/post?Parm1=1234&Parm2=Keith');
        Content.WriteFrom('Hello Youtube');
        Request.Content := Content;
        Request.GetHeaders(Headers);
        Headers.Add('Authorisation', 'This is a Token');
        Client.Send(Request, Response);
    end;
}
