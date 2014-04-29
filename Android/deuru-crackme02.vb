'''
'
' Solution to Android crackme02 by deuru.
' http://crackmes.de/users/deurus/android_crackme02/
'
' 2014/04/29
' spageek.net
'
'''

Module Module1

    Sub Main()

        Dim Nombre As String = ""
        Dim Serial, tam_nombre, ano, temp As Integer

        Console.Write("Nombre: ")
        Nombre = Console.ReadLine()

        tam_nombre = 1
        ano = Date.Now.Year

        While tam_nombre <= Nombre.Length
            temp += ano * tam_nombre
            temp += temp Mod 1638
            tam_nombre += 1
        End While

        Console.WriteLine("El serial es: " & temp)

        Console.Read()

    End Sub

End Module
