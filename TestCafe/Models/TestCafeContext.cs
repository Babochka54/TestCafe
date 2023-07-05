using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace TestCafe.Models;

public partial class TestCafeContext : DbContext
{
    public TestCafeContext()
    {
    }

    public TestCafeContext(DbContextOptions<TestCafeContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<MenuItem> MenuItems { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Server=localhost;Database=TestCafe;Persist Security Info=False;User ID=root; Password=root;MultipleActiveResultSets=False;Encrypt=False;TrustServerCertificate=False;Connection Timeout=30;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Category>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.name)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("category");
        });

        modelBuilder.Entity<MenuItem>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CategoryId).HasColumnName("categoryId");
            entity.Property(e => e.Descriprion)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("descriprion");
            entity.Property(e => e.ImageRef)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("imageRef");
            entity.Property(e => e.ItemName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("itemName");
            entity.Property(e => e.Price)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("price");

            entity.HasOne(d => d.Category).WithMany(p => p.MenuItems)
                .HasForeignKey(d => d.CategoryId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MenuItems_Categories");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
