import os
import sys

print("\n" + "="*50)
print(" DIAGNOSTIC PROBE")
print("="*50)
print(f"1. Current Directory (os.getcwd):")
print(f"   {os.getcwd()}")
print("-" * 20)

try:
    import library.train_util
    print(f"2. Loaded 'library.train_util' from:")
    print(f"   {library.train_util.__file__}")
except ImportError as e:
    print(f"2. FAILED to import library.train_util: {e}")

print("-" * 20)
print(f"3. Script Location (this file):")
print(f"   {os.path.abspath(__file__)}")
print("="*50 + "\n")
