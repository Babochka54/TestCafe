﻿using System;
using System.Collections.Generic;

namespace TestCafe.Models;

public partial class Category
{
    public int Id { get; set; }

    public string name { get; set; } = null!;

    public virtual ICollection<MenuItem> MenuItems { get; set; } = new List<MenuItem>();
}
