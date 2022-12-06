namespace TConsoleProjLib;

public class TConsoleProj
{
    public string Name { get; set; }
    public Guid Id { get; }
    public bool AutoId { get; } = false;

    public TConsoleProj(string name)
    {
        Name = name;
        Id = System.Guid.NewGuid();
        AutoId = true;
    }

    public TConsoleProj(string name, Guid id)
    {
        Name = name;
        Id = id;
        AutoId = false;
    }

    public override string ToString()
    {
        var className = typeof(TConsoleProj).Name;

        return String.Format($"class {className}: (Name={Name},Id={Id},AutoId={AutoId})");
    }
}
