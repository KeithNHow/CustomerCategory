/// <summary>
/// PageExtension KNH Vendor List (ID 50004) extends Record Vendor List.
/// </summary>
pageextension 50302 "KNH VendorList" extends "Vendor List"
{
    trigger OnOpenPage()
    var
        lvHttpClient: HttpClient;
        lvHttpRequestMessage: HttpRequestMessage;
        lvHttpResponseMessage: HttpResponseMessage;
        lvHttpContent: HttpContent;
        Headers: HttpHeaders;
    begin
        lvHttpRequestMessage.Method := 'Post';
        lvHttpRequestMessage.SetRequestUri('https://ptsv2.com/t/zvpyk-1638197011/post?Parm1=1234&Parm2=Keith');
        lvHttpContent.WriteFrom('Hello Youtube');
        lvHttpRequestMessage.Content := lvHttpContent;
        lvHttpRequestMessage.GetHeaders(Headers);
        Headers.Add('Authorisation', 'This is a Token');
        lvHttpClient.Send(lvHttpRequestMessage, lvHttpResponseMessage);
    end;
}
