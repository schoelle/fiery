program HelloWorld;

uses
  Scanner;

begin
  TokenOpenFile('../examples/Any.fy');
  while lastToken <> TOK_EOF do
  begin
    if lastToken = TOK_IDENT then
      WriteLn('IDENT = ', lastIdent)
    else
      WriteLn('TOKEN = ', lastToken);
    TokenNext()
  end;
end.
