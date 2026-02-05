unit utilities;

{$mode ObjFPC}{$H+}

interface

uses
      Classes, SysUtils, Math;

function getRandomIntBetweenRange(minValue : Integer; maxValue : Integer) : Integer;

implementation

function getRandomIntBetweenRange(const minValue : Integer; const maxValue : Integer) : Integer;
begin
    return RandomRange(minValue, maxValue);
end.

