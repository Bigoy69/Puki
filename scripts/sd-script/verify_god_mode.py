import os

target_file = "/app/sd-script/sdxl_train_network.py"

print(f"--- CHECKING FILE: {target_file} ---")
if os.path.exists(target_file):
    with open(target_file, 'r', encoding='utf-8') as f:
        content = f.read()
        if "GOD MODE" in content:
            print("\n[SUCCESS] GOD MODE FOUND IN FILE!")
            print("Lines found:")
            print("\n".join([line for line in content.split('\n') if "GOD MODE" in line][:5]))
        else:
            print("\n[FAIL] GOD MODE NOT FOUND. The file is the OLD version.")
else:
    print(f"\n[ERROR] File not found at {target_file}")
    
print("\n--- CHECKING DIRECTORY ---")
try:
    print(os.listdir("/app/sd-script"))
except Exception as e:
    print(e)
