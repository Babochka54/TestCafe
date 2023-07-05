namespace TestCafe.Models
{
    public class IndexModel
    {
        public string? NavSelected;
        public List<Category> categories { get; set; } = new();
        public List<MenuItem> items { get; set; } = new();

    }
}
