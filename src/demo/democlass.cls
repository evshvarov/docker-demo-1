Class demo.democlass
{

/// Hello World
ClassMethod HelloWorld() As %Status
{
        Set sc = $$$OK
        // do something
        w "Hello World",!
        w "The version of IRIS is "_$system.Version.GetVersion(),!

        Return sc
}

}
