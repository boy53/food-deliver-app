export const supabaseService = {
  getClient: () => ({ url: process.env.SUPABASE_URL }),
};
