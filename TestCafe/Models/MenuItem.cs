using System;
using System.Collections.Generic;

namespace TestCafe.Models;

public partial class MenuItem
{
    public int Id { get; set; }

    public string ItemName { get; set; } = null!;

    public decimal Price { get; set; }

    public int CategoryId { get; set; }

    public string? ImageRef { get; set; }

    public string? Descriprion { get; set; }

    public virtual Category Category { get; set; } = null!;
}
